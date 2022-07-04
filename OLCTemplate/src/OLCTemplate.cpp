#include "OLCTemplate.h"

#define CHECK_ERROR(error, message, errorCodeOffset)                    \
	do                                                                  \
	{                                                                   \
		if ((error) != _OLC rcode::OK)                                  \
		{                                                               \
			std::cerr << (message) << '\n';                             \
			switch (error)                                              \
			{                                                           \
				case _OLC rcode::FAIL:    return (errorCodeOffset) + 1; \
				case _OLC rcode::NO_FILE: return (errorCodeOffset) + 2; \
				default:                  return (errorCodeOffset) + 0; \
			}                                                           \
		}                                                               \
	}                                                                   \
	while (false)

int Main(int argc, char** argv)
{
	UNUSED(argc, argv);

	olc::rcode error = olc::rcode::OK;
	OLCTemplate olcTemplate;

	error = olcTemplate.Construct(320, 200, 4, 4); // (1280, 800) / 4 -> 16:10 aspect ratio
	CHECK_ERROR(error, "Failed to create application.", 0x1000);

	error = olcTemplate.Start();
	CHECK_ERROR(error, "Failed to run application.", 0x2000);

	return 0;
}

OLCTemplate::OLCTemplate() : olc::PixelGameEngine()
{
	sAppName = "OLC Template";
}

bool OLCTemplate::OnUserCreate()
{
	return true;
}

bool OLCTemplate::OnUserUpdate(float elapsedTime)
{
	return true;
}

bool OLCTemplate::OnUserDestroy()
{
	return true;
}
