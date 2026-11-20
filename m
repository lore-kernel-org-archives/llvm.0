Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166039;
	b=2btOJtC2LuD9+/H30T5DpG0/sjvonU9ESs1BEYHiMgyDbUqHa78OVvB5MsUSJMOj4zfS
	 NE7xQT5WGI21CLTqj7b9x32bktgEwAO19z8flr3wxcwlAqNBaCzfczIZAXqBbjV+8QkAs
	 T/FUoOh4oYPlDIN3qZ2Md/ULE7njsbbRoDpevK6TTjvl3xTXQRlVcIVBwFhJctka0etSH
	 S6A9aXglRlO0ScKvSvVIHvXijmUT36FnzyQtkFBcWrfYy6xijoHqwD9j7bZCDFcWrQ6yi
	 QAmaxCdCCExC91ZGOBLqThsDef+0E2Qw9cdCBAbXsNKSGYqQWO6wQROEUe0KlEjT79A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166039;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=GRLtc0zsKWCiRyNINZflpJfE4EpJ+sxnKBRb9r53R+U=;
	b=G4bDCuCACQ98Sx07/V6fWYHbrcWv6wy7DQCZY0UAJFQxZX6fIr3PyJ2X0k6BpN7OwqJx
	 RNNo9UIyVB5EUQg7Mg9f04XAsOUg1CeudidR3YLE2lOl0BYOqIzjNSY/qQneedfVgeY5Q
	 40BmWBq/1cggH7vHfSLkXAYbIPsdvpRLHDQhOq/+/VQhjyz+g/mwfl0fy3EX3gbkjdf6V
	 wm7//olkYsnOjgXXmH3wFJl0HmwvYLSgN7l8Iokl8NYTTnPQl9GQvm026rjrTeHPoM/2U
	 2dA4E6KfmI4ratlukjj/YDfRU9R6CaopJJIyvL/ZxMsXrhSGkShxRgXLnANWyH4CwoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eq7yMALt;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102A0606A326
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 09:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 102A0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eq7yMALt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795166039; x=1826702039;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=6u1JnrIesR1G82fQF15PMeN+1EsD+TC0aLsY9JIn0+s=;
  b=eq7yMALt+OP1ooVClY6u9MKS8H2cF5F8MHBlJhgRUINVHmbvH5G3zq8G
   y4zo5MopJbCLSoF4vQ/opm0bxXPvK4ByjfZbtjpwyIDN6Q0F4mUr5XKce
   8P/fnpjzm3UeXqYIKRpvq6XTkQ9Ew18x7rT4ifkgFIzbnX/qSV9QDvRRE
   d0jT4yHLmh44oenznFEQmDL0y7Kbi0gVchvrHoTmMMfYZ3wyiHHLW0Pud
   BBBsxeWupXu3UiTzjD1i5q32M57AP2cqSKY7GkGsOvDvMJZATSv5UD1tO
   LVNjw3tdtVXsDoDGXOuP0NU7G++uEDNAG+mfUXIMl4rVod0uKCcdlEG8I
   Q==;
X-CSE-ConnectionGUID: dLjyI6TIQe+DngojajTLbA==
X-CSE-MsgGUID: pUDtNL/FS3aqqb723xB0EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4048902"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4048902"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 01:13:58 -0800
X-CSE-ConnectionGUID: BMiW046+RbqUuFRgouMGPQ==
X-CSE-MsgGUID: 0CUbDhZHTeihwFq+Or78jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="11088863"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.250])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 01:13:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ian Rogers <irogers@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers
 <irogers@google.com>, Mika Kahola <mika.kahola@intel.com>
Subject: Re: [PATCH] drm/i915/display: Pass crtc->pipe to
 intel_pmdemand_update_port_clock()
In-Reply-To: <20261119170642.1521198-1-irogers@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261119170642.1521198-1-irogers@google.com>
Date: Fri, 20 Nov 2026 11:13:51 +0200
Message-ID: <bc01cd57f349fa647fb0e38bfbbcba108ff8289e@intel.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 19 Nov 2026, Ian Rogers <irogers@google.com> wrote:
> In intel_modeset_readout_hw_state(), 'pipe' is only populated inside the
> earlier for_each_intel_encoder() loop. Later, inside
> for_each_intel_crtc(), intel_pmdemand_update_port_clock() is called with
> 'pipe' instead of 'crtc->pipe'.
>
> When the encoder list is empty (for example on headless SKUs or VBT
> configurations with all display outputs disabled), 'pipe' is completely
> uninitialized and indexes out-of-bounds into pmdemand_state->ddi_clocks[].
> Even when encoders are present, every CRTC iteration overwrites the slot
> for the last encoder's pipe rather than updating crtc->pipe.
>
> Scope 'pipe' locally to for_each_intel_encoder() and pass crtc->pipe to
> intel_pmdemand_update_port_clock().
>
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wconditional-uninitialized enabled; fix and changelog drafted with an AI
> coding assistant. Build-tested for both i915 and xe under LLVM=1 W=1
> (-Werror) and -Wconditional-uninitialized; not runtime-tested on Intel
> Xe_LPD+ hardware.
>
> Fixes: 4c4cc7ac207f ("drm/i915/mtl: Add support for PM DEMAND")
> Signed-off-by: Ian Rogers <irogers@google.com>

Cc: <stable@vger.kernel.org> # v6.5+
Cc: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_modeset_setup.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> index 6aed88173770..e5d7c05e006a 100644
> --- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> +++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> @@ -695,7 +695,6 @@ static void intel_modeset_readout_hw_state(struct intel_display *display)
>  {
>  	struct intel_pmdemand_state *pmdemand_state =
>  		to_intel_pmdemand_state(display->pmdemand.obj.state);
> -	enum pipe pipe;
>  	struct intel_crtc *crtc;
>  	struct intel_encoder *encoder;
>  	struct intel_connector *connector;
> @@ -726,8 +725,7 @@ static void intel_modeset_readout_hw_state(struct intel_display *display)
>  
>  	for_each_intel_encoder(display->drm, encoder) {
>  		struct intel_crtc_state *crtc_state = NULL;
> -
> -		pipe = 0;
> +		enum pipe pipe = PIPE_A;
>  
>  		if (encoder->get_hw_state(encoder, &pipe)) {
>  			crtc = intel_crtc_for_pipe(display, pipe);
> @@ -869,7 +867,8 @@ static void intel_modeset_readout_hw_state(struct intel_display *display)
>  		drm_dbg_kms(display->drm, "[CRTC:%d:%s] min_cdclk %d kHz\n",
>  			    crtc->base.base.id, crtc->base.name, crtc_state->min_cdclk);
>  
> -		intel_pmdemand_update_port_clock(display, pmdemand_state, pipe,
> +		intel_pmdemand_update_port_clock(display, pmdemand_state,
> +						 crtc->pipe,
>  						 crtc_state->port_clock);
>  	}

-- 
Jani Nikula, Intel
