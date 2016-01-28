using ThighDemo
using Base.Test

function test_readPhantom()
    @test size(ThighDemo.readPhantom(1)) == (51, 48);
    @test size(ThighDemo.readPhantom(2)) == (104, 99);
    @test size(ThighDemo.readPhantom(3)) == (211, 200);
    @test size(ThighDemo.readPhantom(4)) == (424, 403);
    @test_throws ErrorException ThighDemo.readPhantom(5);
end

function test_id2_slowness()
    M = [0 3 4;5 6 7;8 9 11];
    V = id2slowness(M);
    for i in 1:3
        for j in 1:3
            @test V[i,j] == 1/speeds[M[i,j]];
        end
    end
end

function runtests()
    test_readPhantom();
    test_id2_slowness();
end
