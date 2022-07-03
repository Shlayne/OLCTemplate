#pragma once

#include <olcPixelGameEngine.h>

namespace olct
{
	void Run();

	class OLCTemplate : public olc::PixelGameEngine
	{
	public:
		OLCTemplate();
	public:
		virtual bool OnUserCreate() override;
		virtual bool OnUserUpdate(float elapsedTime) override;
		virtual bool OnUserDestroy() override;
	private:

	};
}
