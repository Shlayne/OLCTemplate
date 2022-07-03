#include "OLCTemplate.h"

namespace olct
{
	void Run()
	{
		olc::rcode error = olc::rcode::OK;
		OLCTemplate olcTemplate;

		error = olcTemplate.Construct(640, 480, 2, 2);
		if (error != olc::rcode::OK)
		{
			std::cerr << "Failed to create application.\n";
			return;
		}

		error = olcTemplate.Start();
		if (error != olc::rcode::OK)
		{
			std::cerr << "Failed to run application.\n";
			return;
		}
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
}
