Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D7518C2C
	for <llvm@lists.linux.dev>; Mon, 31 Jul 2023 15:55:30 +0000 (UTC)
Received: from [192.168.1.166] ([91.218.190.200])
	by cmgsmtp with ESMTPSA
	id QVEuqzesOPm6CQVEvqrTep; Mon, 31 Jul 2023 17:55:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
	t=1690818922; bh=Yp95+3EY9f7hBdv+WzMvSHfhSdPzd3L/hdIpYvXs3nI=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=uOruI7o76E0/KCiYfTcvDrBhcZ9jBJLIhkjz/03vnp4znL1fhN74f4uIlthPgjXgl
	 GCv3tlVm5R/ghFuVx02EDP9+RobTlvIP0QEq3mhEuwmSMar79JYbhltebAdy/LNBQg
	 6Z4z3cC2q0YCl6P6XPQdVNXRXLqCRbxxWKfGSdEisQa0Q3rZG9Mav3SpAqLlupJ7ro
	 9V2WXeUETZUVEyiv6wB7h52tWzk3TfG+I+2KnxDjLQrb4yqb7YoKUpCunXX5wT/Lm6
	 KHM3lq3nomX/qOtM0lAHo+7DFlLT3irgV8q8zg2IZ2nvayibUsHr7lQgEIO/Ql8PQk
	 wUFbs3bp+CfLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
	t=1690818922; bh=Yp95+3EY9f7hBdv+WzMvSHfhSdPzd3L/hdIpYvXs3nI=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=uOruI7o76E0/KCiYfTcvDrBhcZ9jBJLIhkjz/03vnp4znL1fhN74f4uIlthPgjXgl
	 GCv3tlVm5R/ghFuVx02EDP9+RobTlvIP0QEq3mhEuwmSMar79JYbhltebAdy/LNBQg
	 6Z4z3cC2q0YCl6P6XPQdVNXRXLqCRbxxWKfGSdEisQa0Q3rZG9Mav3SpAqLlupJ7ro
	 9V2WXeUETZUVEyiv6wB7h52tWzk3TfG+I+2KnxDjLQrb4yqb7YoKUpCunXX5wT/Lm6
	 KHM3lq3nomX/qOtM0lAHo+7DFlLT3irgV8q8zg2IZ2nvayibUsHr7lQgEIO/Ql8PQk
	 wUFbs3bp+CfLg==
Message-ID: <f833e6f20a0e745163d5abd4bdb62d6d3b7e156e.camel@triops.cz>
Subject: Re: [usb:usb-testing 25/42] drivers/usb/dwc3/dwc3-octeon.c:403:10:
 warning: shift count >= width of type
From: Ladislav Michl <ladis@triops.cz>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel test robot
	 <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-usb@vger.kernel.org
Date: Mon, 31 Jul 2023 17:55:20 +0200
In-Reply-To: <20230731154906.GA1823389@dev-arch.thelio-3990X>
References: <202307260537.MROrhVNM-lkp@intel.com>
	 <2023072653-viewable-harmonics-09e0@gregkh>
	 <fbceb8e5444eab23788501b002926e07f54fdd7c.camel@triops.cz>
	 <20230731154906.GA1823389@dev-arch.thelio-3990X>
Organization: Triops, s.r.o.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHDUUouenX+wc09TBc9VfvKOpMzH53Yj/b6ZHML7s/r+2FfeP/0nZQbstfEobNT3QqTK1A9Vaz4Ag20LCq1nBFiihi/r64UhvyGnztEQNZdprW2/UJGS
 1XNV6rdquitKLLfLH4aTRqP2ikRfqTxAmDoL1HSKgiGTz3ov+oeLxTjuJBfHqeSvIJ1VOojtjodiWg0Ifw+vhkUbhkwrINIEBoklaSnJjgJVJ3DPfJXYJpoV
 QYynnrZgcuRqU0kDCe4NabxBrng3fg8l/nDfKiTmN3LeMfHuLD4Sdp/h4choOTbOez8M7XmPpnFxHL+yDulymeRAOaX4tHAHAe7bxcPbs1Y=

Hi Nathan,

On Mon, 2023-07-31 at 08:49 -0700, Nathan Chancellor wrote:
> Hi Ladislav,
>=20
> On Fri, Jul 28, 2023 at 08:48:20AM +0200, Ladislav Michl wrote:
> > Hi Greg,
> >=20
> > I'm sorry for late reply (travelling)
> >=20
> > On Wed, 2023-07-26 at 06:39 +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Jul 26, 2023 at 05:09:56AM +0800, kernel test robot
> > > wrote:
> > > > Hi Ladislav,
> > > >=20
> > > > First bad commit (maybe !=3D root cause):
> > > >=20
> > > > tree:=C2=A0=C2=A0
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git=C2=
=A0
> > > > usb-
> > > > testing
> > > > head:=C2=A0=C2=A0 ac47051f0bb8ccf1eaedb296a19fcb541474db53
> > > > commit: b3061c5a15fe460502e9574b4663dd7c6ed80b48 [25/42] usb:
> > > > dwc3:
> > > > dwc3-octeon: Convert to glue driver
> > >=20
> > > Ladislav, I've dropped your dwc3-octeon patches from my tree now,
> > > please fix up and resend when you have this resolved.
> >=20
> > As I didn't find a better place to ask, I'm asking here:
> > all registers are 64bit and driver is now using GENMASK and BIT
> > macros to access their values. Reported problem comes from 32bit
> > configuration, where BIT is UL(1) << (nr) and BITS_PER_LONG is 32.
> > Is using GENMASK_ULL and BIT_ULL preferred way to go here? I'm not
> > a bit fan of "fixing" code just to silence warning on irrelevant
> > configurations, but will do it unless someone points me to better
> > way.
>=20
> I am not Greg but I see you did not get a response on this yet. Yes,
> you should use the _ULL macros to ensure the values are always 64-
> bit, which will avoid this issue altogether.

Thanks for an answer. Although it comes a bit late as v5 with mentioned
change was sent to mailing list a few hours ago :) Let's see what else
pops up...

Best regards,
	l.
