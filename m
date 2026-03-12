Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659CF36165B
	for <llvm@lists.linux.dev>; Thu, 12 Mar 2026 16:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773332137; cv=none; b=ptwHcoHY66yx4qHz4WgfyupssLjuj1oSnXlx6BQrqPyr617ayRIzc2bUfz8M4gATM1byidT3zezBY41GX4qvj6JkFHfx/czxsqaq78cfMQnpu1VncpQ2bLc56kzyUm0E+Pe5oA6jxvWeg9M56Hu1q5P1gxGOmHtnwJ5YD+Zu/8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773332137; c=relaxed/simple;
	bh=Il21NT5G3bUSYbGNgP2ZFEeaPk8AZ8BNvAj2u09XGwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dl9wxndG+JQh2WbAK5bCUdj93Vhmht8kWR9pTbuqs05uXUx50Y75QhTzjs2mqNR4hsT+/rcrn1nIfbR69VVatFxIeQ88jrcZfSdDL5LIuLzSed1lI78/oAypgZnI+FAOs94iT6Bo32sspL6uDFF3MfkgteIcs9f1GVaPh8+D5tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=ba3MneD+; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="ba3MneD+"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-127380532eeso361838c88.1
        for <llvm@lists.linux.dev>; Thu, 12 Mar 2026 09:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1773332134; x=1773936934; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wYTHfLNKxvy35JvH8B5/QuRK+srFMTLyCSw6VerOpmQ=;
        b=ba3MneD+jDiWaYUQ3ySvO6JRaSfs1KIxI5IZuzReSaa3frHLOdZfgtgWD3qhuz0oIl
         n0J/EG+Qh/9x831m1P39U7JMgd07wDjoCaiywt3uYl4Xrb8ZOWhFsNFSTuIzrEnXnSEL
         X8rg4NHYiMKC8nbc4zAp011Z13hreSCzAFgV2TA9ie5pPhyggxcJ0u1nV7PQjboAaOlu
         qjU7TRM40Nh+v0KCgKurRuOZ157ElDaZ6HkWVuLPXJg1s1LFokb+s8QzbthLqcALNNJ7
         632V9n0ZoZOPJPYY/ZxGxggD+5hSNkqSS9cYGF8SNW8h6ADRbrU5DFmV8ouHgXnx+5f2
         57Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773332134; x=1773936934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYTHfLNKxvy35JvH8B5/QuRK+srFMTLyCSw6VerOpmQ=;
        b=K8loJ58z7OTWlB9f+DCaFf2THTVui7Tc7a4BoXWLHh/5nTrKTBl0sxVugDzQeQjjHw
         5eJabcl577T+MwojG/HW6LzfTqRBcFpF+tykn2RRDQzQ41odivD5a/9/spBxYwcvtDIN
         E9LJ35prbUJkYL+D6TyUeMHQv8JO8TlNVN5Ot/+EU0O06AKu9fWdHdiaxbxz2uNKa6p3
         d6aFblI0rVTfA8RqWUBQDDFXvkSgExe4huB3ei0A+tG2cD5NRHKOWuY5kHT+a5WeCw2X
         c3Ss4Pwo1Ol+IOFkY9zoJcNkjrJbWgqQ8xVJEXyvMwlCMAmUOI7WDbewMCrUAn86rDML
         SDLA==
X-Forwarded-Encrypted: i=1; AJvYcCUUlAhgwkS9TiOqXZ+khjl7RmItywfIohXfUi9/NuBxainwqy6frv8EfepKAQWioNMdFx6r@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8eXoCwLOyKCG4tnhRiJafzqIaHt91RLDDwLlbITqzJ6PnlsHE
	bUiflv1Z0Ob63ZqQ4+Xql1jvrUupHx/akazPCfUJNxrdQvbLh1BEX6yH10DQOrbv/so=
X-Gm-Gg: ATEYQzxxI5oWCSykF85Mj9QbU7DbCw6tXjznUpqXjiDttuZZcO5tUc3BEO3isSm/7Gg
	81CcRV7/jeBVZJg5yPhTNp9nXGUlPckHs3mfDVT68o3oqCAjUR7g6qOCpwQytfE2q5VXWKWAmCT
	bIUQaVTmUEVwLP2L3duJX904uMUhXIBeNiZFDNyfZTGfaOKMueFzlA4gmJQ52xU6xNo69/WGNE5
	LhK5nzmZcrhvDJkTZJhDNjikz3PW+hLHnryfTyp6knUbiJ5pnvy7hv+4oxlzh7e7OahqqChz70/
	rNSs0o2LaKewxh/G5aRrz2GHDfj2Mn8BvWFwkZASJxyXwVd/kQGLBjU2rFOS4mslrWH9ok2ZsGr
	ZhmflUj6YjV+ZQIcyTgIsLXll9pzYzlLUV5aMkE0X78KFRdnnWvgVBYc1ZJ1P1zj6Our5ARevPB
	/03giJ5SPef0uuD8iojNSdpe5Vlw==
X-Received: by 2002:a05:7300:ec17:b0:2ba:7783:d1cd with SMTP id 5a478bee46e88-2bea5475343mr137153eec.12.1773332134317;
        Thu, 12 Mar 2026 09:15:34 -0700 (PDT)
Received: from mozart.vkv.me ([2001:5a8:468b:d015:53d0:dd05:1bb3:9034])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8aa7413esm6963232eec.24.2026.03.12.09.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 09:15:33 -0700 (PDT)
Date: Thu, 12 Mar 2026 09:15:30 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org, Charlene Liu <charlene.liu@amd.com>,
	Ovidiu Bunea <ovidiu.bunea@amd.com>, Alex Hung <alex.hung@amd.com>,
	Dan Wheeler <daniel.wheeler@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	llvm@lists.linux.dev
Subject: Re: [REGRESSION][PATCH] drm/amd/display: Fix uninitialized variable
 which breaks full LTO
Message-ID: <abLmonL-8QubcCpA@mozart.vkv.me>
References: <ef7266eb7802ce6d68ebd9356477e9671f0c94e0.1773116305.git.calvin@wbinvd.org>
 <20260312080245.GA3988095@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312080245.GA3988095@ax162>

On Thursday 03/12 at 01:02 -0700, Nathan Chancellor wrote:
> Hi Calvin,
> 
> On Mon, Mar 09, 2026 at 09:24:57PM -0700, Calvin Owens wrote:
> > Commit e1b385726f7f ("drm/amd/display: Add additional checks for PSP
> > footer size") introduced a use of an uninitialized stack variable
> > in dm_dmub_sw_init() (region_params.bss_data_size).
> > 
> > Interestingly, this seems to cause no issue on normal kernels. But when
> > full LTO is enabled, it causes the compiler to "optimize" out huge
> > swaths of amdgpu initialization code, and the driver is unusable:
> 
> Yeah, this appears to be a very unfortunate case of "clang encountered known
> undefined behavior and stopped code generation", which we would like to
> avoid but figuring out a proper upstreamable solution is hard. The most
> recent attempt:
> 
>   https://github.com/llvm/llvm-project/pull/146791
> 
> My guess is that LTO allows inlining of
> dmub_srv_get_fw_meta_info_from_raw_fw() into dm_dmub_sw_init(), at which
> point it can see that the result of accessing an uninitialized
> region_params.bss_data_size will be used through
> fw_meta_info_params.fw_bss_data and gives up generating the rest of the
> function.

Thanks for looking Nathan. I'll keep an eye on that and see if it's able
to catch this example. I've tried to come up with a minimal reproducer,
but I haven't had any luck yet (so far I always get the warning), would
that be helpful at all?

I put the full W=2 output for the one file here in case anyone else
wants to look:

   https://github.com/jcalvinowens/lkml-debug/blob/main/amdgpu-lto/gcc-warns.txt
   https://github.com/jcalvinowens/lkml-debug/blob/main/amdgpu-lto/llvm-warns.txt

Somehow 'make drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.o' doesn't
work, I want to look at that later because it was mildly annoying while
digging into this.

> >     amdgpu 0000:03:00.0: [drm] Loading DMUB firmware via PSP: version=0x07002F00
> >     amdgpu 0000:03:00.0: sw_init of IP block <dm> failed 5
> >     amdgpu 0000:03:00.0: amdgpu_device_ip_init failed
> >     amdgpu 0000:03:00.0: Fatal error during GPU init
> > 
> > It surprises me that neither gcc nor clang emit a warning about this: I
> > only found it by bisecting the LTO breakage.
> 
> gcc's -Wmaybe-uninitialized is disabled by default for the kernel but
> even enabling it with KCFLAGS does not show an instance here, which I
> find quite surprising... for clang, it is harder because the warning
> happens early in the frontend where it might not be able to track a
> value that well.

GCC does flag what seems to me to be a real but benign warning about an
ERR_PTR check that doesn't handle NULL in the same file:

    https://lore.kernel.org/lkml/6aaf2cf4bd19363a85f35e649685d7bdae400253.1773157137.git.calvin@wbinvd.org/

I'm also trying to find a minimal reproducer for GCC, no luck yet.

> > Fix by using the old value for region_params.bss_data_size in place of
> > the uninitialized reference, which makes amdgpu work with LTO again.
> > 
> > Fixes: e1b385726f7f ("drm/amd/display: Add additional checks for PSP footer size")
> > Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index b3d6f2cd8ab6..e69e61163ae9 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -2554,7 +2554,7 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
> >  	fw_meta_info_params.fw_inst_const = adev->dm.dmub_fw->data +
> >  					    le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
> >  					    PSP_HEADER_BYTES_256;
> > -	fw_meta_info_params.fw_bss_data = region_params.bss_data_size ? adev->dm.dmub_fw->data +
> > +	fw_meta_info_params.fw_bss_data = le32_to_cpu(hdr->bss_data_bytes) ? adev->dm.dmub_fw->data +
> 
> Maybe it would be better to use fw_meta_info_params.bss_data_size
> instead of le32_to_cpu(hdr->bss_data_bytes)? Obviously it is the same
> value but it would result in a smaller change. It seems likely that this
> was just a copy and paste failure.

Agreed. That ends up being almost self evidently correct if I force git
to add an extra context line with the assignment, I always forget I can
do that:

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b3d6f2cd8ab6..0d1c772ef713 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2553,9 +2553,9 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
 	fw_meta_info_params.bss_data_size = le32_to_cpu(hdr->bss_data_bytes);
 	fw_meta_info_params.fw_inst_const = adev->dm.dmub_fw->data +
 					    le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
 					    PSP_HEADER_BYTES_256;
-	fw_meta_info_params.fw_bss_data = region_params.bss_data_size ? adev->dm.dmub_fw->data +
+	fw_meta_info_params.fw_bss_data = fw_meta_info_params.bss_data_size ? adev->dm.dmub_fw->data +
 					  le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
 					  le32_to_cpu(hdr->inst_const_bytes) : NULL;
 	fw_meta_info_params.custom_psp_footer_size = 0;
 

I'll send a v2 in a little bit.

Thanks,
Calvin

> >  					  le32_to_cpu(hdr->header.ucode_array_offset_bytes) +
> >  					  le32_to_cpu(hdr->inst_const_bytes) : NULL;
> >  	fw_meta_info_params.custom_psp_footer_size = 0;
> > -- 
> > 2.47.3
> > 
