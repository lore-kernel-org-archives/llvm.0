Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A89155C82
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 16:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876772; cv=none; b=YP8kpwdxMeVoWUIsIn95yZ+kSI4mPYAByRSP04B93mSgIo76//ZQbWSSDSHvr9HdEFu7iFbmnbL5PWOtei/rS/LYKBC/A6VFfwQA5oSwBzBs+MA9a0a6IIZImoe0cMKVFeZCtOdGJXBsKA8uOG+ZfHhkOVa/fR2j+cqDttGU06I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876772; c=relaxed/simple;
	bh=BOQQ5+dDeyDGN5ehIWoCsWYAl95m1SowanHJoLBt+GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j80Hz5r1gW8d+zQ8A2S4Ds1N/grJo6tpMBfHFQe0sLiLQBoZrDrOAtoGN4Use3xo8xF9NyTizNJpH+b5o9dST6ONbND2aDWaZ1+3uvUa6R40NRT0PKk95ZkN5yPvakYBN385MCc9C/7BAzu2jBw2zChGW0qpkpwwBAz/H8OONbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mijp4cMr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mijp4cMr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776876770; x=1808412770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BOQQ5+dDeyDGN5ehIWoCsWYAl95m1SowanHJoLBt+GM=;
  b=Mijp4cMrOwAwiGlOL3qlHYSbtwG4iZ/1TUnUcWiQ7Tu3Wg5UwWMdITOf
   yPkZGXy34PkKH197+LHEcS1Ha0NSVAe7CLeDxBN39iYOBbGGKIyisOogl
   /g65ov1OE3Seqm7xLKvQsXAKuhFhX+xHUBJG7HaaO8NplbrzlIFkAe7gV
   cH2iZ47YjfB3OHRy0x7+Q3cYh9pyOW1uLZzu+FkOlSFEZvyAkolpoAvDy
   oBYfOigGmXYLzrOKO6lFdLh9SqM2tfu3ZJkRBl2/qW0OlFury/Yk3KwEc
   MsR18j3z33ZuWYu3dqy013b5uCIm0iRfCXwH7hz4tTbOTskRvIhsp3wAg
   A==;
X-CSE-ConnectionGUID: gFHHKlGRSA24KWQSzBqRZg==
X-CSE-MsgGUID: TeqoOxFaR/u+XJAsETl2CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="65370879"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="65370879"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 09:52:50 -0700
X-CSE-ConnectionGUID: UGBdbc8dTh6yJlJW1c7kXA==
X-CSE-MsgGUID: kaGngltQRXK3CWkBzrcj4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="237384331"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.10])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 09:52:43 -0700
Date: Wed, 22 Apr 2026 19:52:40 +0300
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
Message-ID: <aej82CO0l9_O1sX2@intel.com>
References: <20260422-vkms-all-config-v4-0-dbb52e9aadc3@bootlin.com>
 <20260422-vkms-all-config-v4-2-dbb52e9aadc3@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260422-vkms-all-config-v4-2-dbb52e9aadc3@bootlin.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Wed, Apr 22, 2026 at 06:47:59PM +0200, Louis Chauvet wrote:
> Having the rotation/reflection name from its value can be useful for
> debugging purpose. Extract the rotation property table and implement
> drm_get_rotation_name.
> 
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_blend.c | 35 ++++++++++++++++++++++++++---------
>  include/drm/drm_blend.h     |  2 ++
>  2 files changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 1f3af27d2418..11d8e13caea3 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -256,6 +256,31 @@ int drm_plane_create_alpha_property(struct drm_plane *plane)
>  }
>  EXPORT_SYMBOL(drm_plane_create_alpha_property);
>  
> +static const struct drm_prop_enum_list rotation_props[] = {
> +	{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
> +	{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
> +	{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
> +	{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
> +	{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
> +	{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
> +};
> +
> +/**
> + * drm_get_rotation_name - Return the name of a rotation
> + * @rotation: The rotation mask (DRM_MODE_ROTATE_* | DRM_MODE_REFLECT_*)
> + *
> + * Returns: the name of the rotation type (unknown) if rotation is not
> + * a known rotation/reflection
> + */
> +const char *drm_get_rotation_name(unsigned int rotation)
> +{
> +	if (rotation < ARRAY_SIZE(rotation_props))
> +		return rotation_props[rotation].name;

The value is a bitmask. This does not work.

-- 
Ville Syrjälä
Intel
