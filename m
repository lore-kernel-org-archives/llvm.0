Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E4F1EEA40
	for <llvm@lists.linux.dev>; Wed, 18 Jun 2025 18:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270746; cv=none; b=FtBLLwt5QJqT7vRkwQ8MN2V1Jtd10zfftDgroZLLvoERUbhz1V/7GvLe0v7Tk+nlBpq2+/ICgD4vVVz6yUBx4CRB5tsnbGRaRQT75NqTsGfVhvljOWTIXkvcN0stdyCtmzKhVkkKb9Cdi2aj4K/GaW8BW2jL1wZswTsZJjV8jcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270746; c=relaxed/simple;
	bh=fAGFVqJ0ijjjkq/JMmoWe7JDhHbAH4lR76XoIgUmddE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkF+YUzylaULRDY+zhFHZmJhFyi5rwItSStub27nYdGReOesIdIUVzzTjE1NeWSBbuaijyOXR4pgEQoIyVyoQIcER4+EyQ8DnQzUP5BqT4xXTYmQATIGhQ5T2poQRilNUfJyy/Bhc8qTZDOSb8JMZg2IgAYVa0jE5tvaBzpXGCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aa/PpOpG; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aa/PpOpG"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72c09f8369cso2308179a34.3
        for <llvm@lists.linux.dev>; Wed, 18 Jun 2025 11:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750270743; x=1750875543; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vep4PV2pZ+9tPEurvQr9lDJXe4H1SpULEo3WQUGiLXg=;
        b=aa/PpOpGr48iHHtTVy3LV+x5H3kUFRrSYbkixjpaEzBbTTIxHVEr5AzNetqOBRTVh+
         Gd1T+08x8lKHeTkp9D9Y2h2s4iOddzUVqIfE5NbxMKYO8YWB4zXeefIgACEp7wPOMTc5
         vZAUe2LH06RtCaXFr7VN/9WbJm/WMqPdbdlVfnyi19gLhp3gwNqZoAOxQIR9xva0Agiw
         x3ixSGKDBxI1Wa0uuTCeP6NEY7FP0dfjzbSa39nRm1EGseTqIslTKqM9qc0DiJEjkeg2
         axgiXrMkRruXY0vW9G7IBtyM1pWk01332pThIql0LzB28MwajFEA1vwTXeh2j/3SW7A1
         6IRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750270743; x=1750875543;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vep4PV2pZ+9tPEurvQr9lDJXe4H1SpULEo3WQUGiLXg=;
        b=pRcEVLQos4UvWGY/oTHa1NEI3w8dDOBwofj/fj3bWbFj7zmprrcTUI8MB5yOlg756F
         1oGPYCshn5oWhjZwBPOZXVtV+FiwTD6/c8qCe64jIaZkxb6bY2mLRvfnge0E0BTXhF9W
         PPRFdd9JI6MV+6fihSTUghcBd4E+59OkANnVPsnDYJrcy0d8/27v7ghn5frVTYlq1eQZ
         p6UKMXSB5GxZqTcbJBFWEr/75aUgNsXYQST6jSmCnqr4G/cbQAzAbWbDmOGFZclVeNPp
         A75vG9L18TAMfITb7+Sviw4Cs/vUThrtG5x/J67yK9BCrD1AyLtWm+GE2MsapbuLomzw
         4gtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUVa7a5cjxq4dBjblDIT6j82EFqpUhEpW3Z5t2aQ6nz2x0Mzc+VEUczNloQSe7239p5Ihr@lists.linux.dev
X-Gm-Message-State: AOJu0YzcRl5KNPENWRc6qPGG1u+PyQDTUoeeo6U9WoIpO2RPBSdIWZV3
	IThfQy/YP0VDtBwkkuQs2OKkke0GImyIAxHct5xYgfJDAT27QEz4944UdnEVbwnX6ys=
X-Gm-Gg: ASbGncvkU+DLepxkOoXCoOtrd3+iwj9XwLqgxD4AvMb45mp5sI6uO6MRzqqEKl6ReMj
	gP6aa2UcTM8troGHxEExURrIDgUo7dKqan8YXm+adtF/3gzOkQUYCncAHqWTcE31pNT4OO6WyM2
	+TfvnUnn8Ge1+0FlvwAbrWphIi2xQ6HbPGutc0uRKWw6XSbFZ9EeoEd60syi51uY0ojoGkpKkOI
	pVqZlYvXgexR8rdwG072C0a8c/Q7k4R31JTXFWBONSXUmVv7LXrOWvh6kVlHtNIDiVYaBUA1anu
	XKFbVFfmicU2DnBz0HX/IFnD97xPYIJGJhirsKZA3Ufx7Ja7DH5PyRJVJ/Gn1OsRg6wBdQ==
X-Google-Smtp-Source: AGHT+IFKnX0nztNeiuWkt0W77J0j5V4cIVncVTmr2DaNrpLni49egH0ASp6YufKpwNA2PVb7YBrY6Q==
X-Received: by 2002:a05:6830:6f42:b0:72c:320b:f827 with SMTP id 46e09a7af769-73a3626800cmr11319258a34.6.1750270743621;
        Wed, 18 Jun 2025 11:19:03 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a28403dc8sm2055669a34.27.2025.06.18.11.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 11:19:02 -0700 (PDT)
Date: Wed, 18 Jun 2025 21:19:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Melissa Wen <mwen@igalia.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Alex Hung <alex.hung@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Dominik Kaszewski <dominik.kaszewski@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Roman Li <roman.li@amd.com>, Simona Vetter <simona@ffwll.ch>,
	Tom Chung <chiahsuan.chung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev, cocci@inria.fr
Subject: Re: [PATCH v3] drm/amd/display: Fix exception handling in
 dm_validate_stream_and_context()
Message-ID: <7ae66816-f682-45f1-b848-eeb5a57a68d9@suswa.mountain>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <e6656c83-ee7a-a253-2028-109138779c94@web.de>
 <ea0ff67b-3665-db82-9792-67a633ba07f5@web.de>
 <32674bac-92c2-8fc7-0977-6d2d81b3257f@amd.com>
 <da489521-7786-4716-8fb8-d79b3c08d93c@web.de>
 <8684e2ba-b644-44c8-adf7-9f1423a1251d@web.de>
 <5ebybqjohsoz7qhsenufkpkkw52w6tgikkbrzpegwotmefhnpn@m2cnzvsfai7v>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ebybqjohsoz7qhsenufkpkkw52w6tgikkbrzpegwotmefhnpn@m2cnzvsfai7v>

On Thu, Jun 12, 2025 at 11:08:10AM -0300, Melissa Wen wrote:
> On 06/10, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Tue, 10 Jun 2025 07:42:40 +0200
> > 
> > The label “cleanup” was used to jump to another pointer check despite of
> > the detail in the implementation of the function “dm_validate_stream_and_context”
> > that it was determined already that corresponding variables contained
> > still null pointers.
> > 
> > 1. Thus return directly if
> >    * a null pointer was passed for the function parameter “stream”
> >      or
> >    * a call of the function “dc_create_plane_state” failed.
> > 
> > 2. Use a more appropriate label instead.
> > 
> > 3. Delete two questionable checks.
> > 
> > 4. Omit extra initialisations (for the variables “dc_state” and “dc_plane_state”)
> >    which became unnecessary with this refactoring.
> > 
> > 
> > This issue was detected by using the Coccinelle software.
> > 
> 
> Hi Markus,
> 
> Thanks for working on this improvement.
> Overall, LGTM. Some nits below.
> 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202506100312.Ms4XgAzW-lkp@intel.com/
> 
> As the patch wasn't merged yet, don't add these two kernel-bot-related lines.
> 
> You only need to add these lines "If you fix the issue in a separate
> patch/commit (i.e. not just a new version of the same patch/commit)"
> 

If you're going to fold the fix into the original commit then it
doesn't matter what the commit message says since it will be gone
in the end either way.

regards,
dan carpenter

