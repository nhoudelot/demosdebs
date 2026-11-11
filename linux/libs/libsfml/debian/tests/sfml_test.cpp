#include <iostream>
#include <SFML/Audio.hpp>
#include <SFML/Graphics.hpp>
#include <SFML/Network.hpp>
#include <SFML/OpenGL.hpp>
#include <SFML/System.hpp>
#include <SFML/Window.hpp>

int main()
{
    // The build test doesn't check any graphics since that would require a
    // display server. We just test some basic Network / System functionality.
    // However when building we can still include the other headers to ensure
    // they compile.

    // Print local IP
    std::cout << "Local IP = " << sf::IpAddress::getLocalAddress().toString()
            << std::endl;

    // Call some time functions from sfml-system
    if ((sf::seconds(5) + sf::milliseconds(1234)).asMilliseconds() != 6234)
        return 1;

    return 0;
}
