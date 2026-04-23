Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD8439DBE3
	for <llvm@lists.linux.dev>; Thu, 23 Apr 2026 10:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776940520; cv=none; b=bC3UdpyrVMlwlKPPqeWnPMTQ3t9MYKWfkeEQQ153+LE3W6+hUBWBiz7sj8YMYFJI6xvfmp43bp50RkSNU8eHGCFSOq9BPmEjkl/BwOZHNqrLcO9hSlt/wVjnPpbKgTb+Ae/dlgDRLGKuQTCiGagnpCff1WMs+MA6iJmMZRVmE18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776940520; c=relaxed/simple;
	bh=LOWQyjTZFchwJDE1fKhJEmvroSlaHMZYHU7jXZMx7pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GW0bb2/aJ4SSpCUoeUc23WAdpGqRxR0RlwYDQ5nWfcS0i0Zw7AIH0hsORJN0BoHhcAmH9F79boeobb4tSWiuXTsYqMElSpUF006n2bevjEF3xkEiNQWxHmerB0qg0Hkyuyd3Xz87iwSlHUlTi+BAMkUinghdJpJ1/sd+ETJ48A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZyGNpwIS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZyGNpwIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776940519; x=1808476519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LOWQyjTZFchwJDE1fKhJEmvroSlaHMZYHU7jXZMx7pk=;
  b=ZyGNpwISzRlRGIMsB4m1znZW2fZDeOTo5sD1r/LF+amN2S4fbvyel2aU
   nrojMvUavw6i7LUde4dgiAReDBnGzpskTKrAxZuAfHOlPhw1UMKVuk2cc
   Jh8Gj8QOf1I4+7WVMsRNhMCHZ7JUDlhTcRQOu86D0fWvdp5Mzd+qcgdEQ
   MtzaW6ujpMNtDnqW5paIcda5qib/hyI7uBV3oHqxPPBF5qQs2QXMMdKTS
   0PpkOWRaSn098HS8+YtBrkjokyteqFJCt8eo4XoKmpUmv+O/Pof6KxEuQ
   Hio/EpUUSmDyaFhBRAeygT4gV3z+end7DBKeKd2+OJXtQBtqt6MOiPzu6
   g==;
X-CSE-ConnectionGUID: vk0bVoApRKazHocd3cTNAg==
X-CSE-MsgGUID: 36qwv4nrSsCuUa6/kWlDtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81513159"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="81513159"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 03:35:18 -0700
X-CSE-ConnectionGUID: Vc2/agFjQ7u0x/DoVEi9UQ==
X-CSE-MsgGUID: j7Siiu+eQLuhYWXUogB/IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="232529290"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 03:35:11 -0700
Date: Thu, 23 Apr 2026 13:35:08 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, victoria@system76.com,
	sebastian.wick@redhat.com, thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, llvm@lists.linux.dev,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito@redhat.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 02/37] drm/blend: Get a rotation name from it's
 bitfield
Message-ID: <aen13JEWrKXiqRw4@intel.com>
References: <20260422-vkms-all-config-v4-0-dbb52e9aadc3@bootlin.com>
 <20260422-vkms-all-config-v4-2-dbb52e9aadc3@bootlin.com>
 <aej82CO0l9_O1sX2@intel.com>
 <d9a66f6a-e07c-4bc2-bd91-8b9cb2994760@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9a66f6a-e07c-4bc2-bd91-8b9cb2994760@bootlin.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Thu, Apr 23, 2026 at 10:47:38AM +0200, Louis Chauvet wrote:
> 
> 
> On 4/22/26 18:52, Ville Syrjälä wrote:
> > On Wed, Apr 22, 2026 at 06:47:59PM +0200, Louis Chauvet wrote:
> >> Having the rotation/reflection name from its value can be useful for
> >> debugging purpose. Extract the rotation property table and implement
> >> drm_get_rotation_name.
> >>
> >> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> >> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> >> ---
> >>   drivers/gpu/drm/drm_blend.c | 35 ++++++++++++++++++++++++++---------
> >>   include/drm/drm_blend.h     |  2 ++
> >>   2 files changed, 28 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> >> index 1f3af27d2418..11d8e13caea3 100644
> >> --- a/drivers/gpu/drm/drm_blend.c
> >> +++ b/drivers/gpu/drm/drm_blend.c
> >> @@ -256,6 +256,31 @@ int drm_plane_create_alpha_property(struct drm_plane *plane)
> >>   }
> >>   EXPORT_SYMBOL(drm_plane_create_alpha_property);
> >>   
> >> +static const struct drm_prop_enum_list rotation_props[] = {
> >> +	{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
> >> +	{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
> >> +	{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
> >> +	{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
> >> +	{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
> >> +	{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
> >> +};
> >> +
> >> +/**
> >> + * drm_get_rotation_name - Return the name of a rotation
> >> + * @rotation: The rotation mask (DRM_MODE_ROTATE_* | DRM_MODE_REFLECT_*)
> >> + *
> >> + * Returns: the name of the rotation type (unknown) if rotation is not
> >> + * a known rotation/reflection
> >> + */
> >> +const char *drm_get_rotation_name(unsigned int rotation)
> >> +{
> >> +	if (rotation < ARRAY_SIZE(rotation_props))
> >> +		return rotation_props[rotation].name;
> > 
> > The value is a bitmask. This does not work.
> > 
> 
> That true, the documentation is not clear.
> 
> Take a look at patch 15 [1] for the usage. Is it better if I change the 
> documentation to:
> 
> drm_get_rotation_name - Returns the name of a rotation/reflection 
> bitmask (with only one bit set).
> @rotation: Bitmask with a single bit set.
> Name of the rotation/reflection, or "(unknown)" if invalid.
> 
> [1]:https://lore.kernel.org/all/20260422-vkms-all-config-v4-15-dbb52e9aadc3@bootlin.com/

For that kind of local thing I don't think it should be called
drm_get_rotation_name(). Also your docs seem to disagree with the
implementation. 

But this does sound like a useful thing to have, eg. in
drm_atomic_plane_print_state().

We already have at least one implementation of this in
i915/display/intel_display_debugfs.c, although with a bit more
terse format (and with somewhat weird "FLIP" terminology) to
make it not eat so much screen real estate.

-- 
Ville Syrjälä
Intel
