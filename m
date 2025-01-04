Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A5815CD52;
	Sat,  4 Jan 2025 08:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735978609; cv=none; b=LfaE51wXF8dwJKjBCV8rXdMQrTuP8a1+gJtLJMPgb0fbhrsqcrzhyj8Sja/+/38d1U7DcFEennUjdArhNf6/7G2NozyhGy9pANL7RNSpYZB+rF4AlLed/tpFPt/XuEZCvBTeuR2b9xadPouNY/84fTMy/qu9tULArcj4W5z+Scw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735978609; c=relaxed/simple;
	bh=UN/ClCXmLVHdqZ49k4NY0JrEKsTcQ5uklWpiSJf+J5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2my61dMe8JKCpzMXiqdbw2MCWPyuMfKZzQebfG6UNzlpkP0yOlw0epK0Ii+N6fc7kDG1rj6EcO0MYTqN15gLXHhEsf9sUrS91tAiDln/VWeJGZiQkQJequ2tffDBQCRMGgLBJOX2VriUMd+/L3pU7j7cG7vM8MugMYbzOlfqZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ErjvOaZZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ErjvOaZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2DAC4CED1;
	Sat,  4 Jan 2025 08:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735978608;
	bh=UN/ClCXmLVHdqZ49k4NY0JrEKsTcQ5uklWpiSJf+J5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErjvOaZZzq6Bc6USMsYRunFWBbfVFfUlOpNEHUg5ohRvIQTrt/4GQZiI8oftQioPZ
	 RTwaAGxxrbDj27fpwf4n1N1WuhdZUQ+IvYWNyuVEsziLPu+4khTulID+1bgp7CIFJe
	 kb8ZrscxOjTwgm2bzsWQkT66+LUUBFwqaspDlmd0=
Date: Sat, 4 Jan 2025 09:16:00 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Brian Norris <briannorris@chromium.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>
Subject: Re: [driver-core:driver-core-testing 29/29]
 include/kunit/platform_device.h:15:15: warning: declaration of 'struct
 completion' will not be visible outside of this function
Message-ID: <2025010433-fretful-gallery-e9cd@gregkh>
References: <202412241917.orLfjA92-lkp@intel.com>
 <Z3bdT0DrjcV6UzHe@google.com>
 <2025010347-outright-fifteen-a9c9@gregkh>
 <Z3gjL50fsmh-fQPH@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3gjL50fsmh-fQPH@google.com>

On Fri, Jan 03, 2025 at 09:49:35AM -0800, Brian Norris wrote:
> On Fri, Jan 03, 2025 at 04:52:01PM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Jan 02, 2025 at 10:39:11AM -0800, Brian Norris wrote:
> > > On Tue, Dec 24, 2024 at 07:37:20PM +0800, kernel test robot wrote:
> > > > All warnings (new ones prefixed by >>):
> > > > 
> > > >    In file included from drivers/base/test/platform-device-test.c:3:
> > > > >> include/kunit/platform_device.h:15:15: warning: declaration of 'struct completion' will not be visible outside of this function [-Wvisibility]
> > > >       15 |                                                  struct completion *x);
> > > >          |                                                         ^
> > > >    1 warning generated.
> > > 
> > > Same:
> > > 
> > > https://lore.kernel.org/lkml/20241213180841.3023843-1-briannorris@chromium.org/
> > > Subject: [PATCH] kunit: platform: Resolve 'struct completion' warning
> > 
> > I guess it should have been cc:ed me.  I'll go dig it up now...
> 
> I sent it where get_maintainer pointed me:
> 
> $ scripts/get_maintainer.pl -f include/kunit/platform_device.h
> Brendan Higgins <brendan.higgins@linux.dev> (maintainer:KERNEL UNIT TESTING FRAMEWORK (KUnit))
> David Gow <davidgow@google.com> (maintainer:KERNEL UNIT TESTING FRAMEWORK (KUnit))
> Rae Moar <rmoar@google.com> (reviewer:KERNEL UNIT TESTING FRAMEWORK (KUnit))
> linux-kselftest@vger.kernel.org (open list:KERNEL UNIT TESTING FRAMEWORK (KUnit))
> kunit-dev@googlegroups.com (open list:KERNEL UNIT TESTING FRAMEWORK (KUnit))
> linux-kernel@vger.kernel.org (open list)

That's good, but you also need to send it to the maintainer that owns
the git tree where the bug is showing up in :)

Something to remember for future stuff, thanks!

greg k-h
