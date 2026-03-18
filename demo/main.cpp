#include "Zipper/Unzipper.hpp"
#include "Zipper/Zipper.hpp"
int main()
{
    zipper::Zipper zipper("test.zip");
    zipper.add("./file/test.txt");
    zipper.add("./file/test2.txt");
    zipper.add("./file/test3.txt");
    zipper.close();

    zipper::Unzipper unzipper("test.zip");
    unzipper.close();

    return 0;
}
