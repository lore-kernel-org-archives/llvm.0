Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2DC36AE2
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 17:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZwYL+EAT"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6934202b8bdso3890951b3a.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 10:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696871855; x=1697476655; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mZPfX7x2eMdylhkZSQUYpUIV1Igau6X98CqTtg2kK00=;
        b=ZwYL+EATqUHUKLWyhxDiEk3i34G1niA/wtM1+88bhdd0ZES0v8K67kHvqqiiPZ0OOd
         nkB5FfJpY+bPxuMaQg1wNQUWCX2OSZU1rYHX8M2z1Xz99etN+MlLWnV909uuL3GVAvER
         cbAc9anV4wxwsfM98BQwzpX7akkk/G5ddzD7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696871855; x=1697476655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZPfX7x2eMdylhkZSQUYpUIV1Igau6X98CqTtg2kK00=;
        b=tRWgjGVm2pwuzkMpvAj1TJnfRyxDRxYApsFEsoBwX+NX3tldEVL4Ves4qgo+NrW6K1
         YLd4IZloHXM8tgNATPSe0+RqmfxPFgNNXq2cV2DXT19cXRoMDZuTN3oUk115BWr8d8fI
         OoAqQHstQjBxHRDVdph9nHSHO3ZNDphrSfwNR/0FL9O61xae0+wGAdIQsd0DOZ4vq/7p
         eUfJtfmIS3XDnQ8tBV1OkzBx+I+B7UFI1rtR2kzEaWkvQfPfT0hvC38D8SnFOd8GdI05
         P0f1wYZdUeJssyP/qQRBwMmHfqoSEuPT4yxv+b72azI5GEmi+TrYdCXQFL0lCNqjVpnA
         ng9g==
X-Gm-Message-State: AOJu0YzLDRrtC2fP28f8CdTIv2YjwSaRjXLUK2pAcT+FggK7my6C75mT
	k07eEubwuUFe3ApcdeRInVdyhbSb8zptd7rBaKM=
X-Google-Smtp-Source: AGHT+IGRPJvr9B4cmDpSNaL74Y75aNcd/QuRBG3CZfS7u+cf/Tw4eJrKuwrF6Urcb3UVPtwC8meVvg==
X-Received: by 2002:a05:6a20:d42a:b0:15c:cb69:8e64 with SMTP id il42-20020a056a20d42a00b0015ccb698e64mr14418431pzb.25.1696871855620;
        Mon, 09 Oct 2023 10:17:35 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h19-20020aa786d3000000b0068ff267f092sm6572557pfo.216.2023.10.09.10.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:17:34 -0700 (PDT)
Date: Mon, 9 Oct 2023 10:17:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev, alsa-devel@alsa-project.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ASoC: apple: mca: Annotate struct mca_data with
 __counted_by
Message-ID: <202310090958.27F5025BDB@keescook>
References: <20230922175050.work.819-kees@kernel.org>
 <202310061321.E7247C52B@keescook>
 <6c7db067-78f2-4637-8064-3dc7c0489b90@sirena.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c7db067-78f2-4637-8064-3dc7c0489b90@sirena.org.uk>

On Fri, Oct 06, 2023 at 09:53:49PM +0100, Mark Brown wrote:
> On Fri, Oct 06, 2023 at 01:22:55PM -0700, Kees Cook wrote:
> > On Fri, Sep 22, 2023 at 10:50:50AM -0700, Kees Cook wrote:
> 
> > > Prepare for the coming implementation by GCC and Clang of the __counted_by
> > > attribute. Flexible array members annotated with __counted_by can have
> > > their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> > > (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> > > functions).
> > > 
> > > As found with Coccinelle[1], add __counted_by for struct mca_data.
> > 
> > Friendly ping. Mark, can you pick this up please?
> 
> Please don't send content free pings and please allow a reasonable time
> for review.  People get busy, go on holiday, attend conferences and so 
> on so unless there is some reason for urgency (like critical bug fixes)
> please allow at least a couple of weeks for review.  If there have been
> review comments then people may be waiting for those to be addressed.
> 
> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the patches
> anyway, so sending again is generally a better approach though there are
> some other maintainers who like them - if in doubt look at how patches
> for the subsystem are normally handled.

I'm happy to do whatever you'd like for this kind of thing, but I'm
annoyed by this likely automated response seems to ask for the things
that have already happened or generally don't make sense. :P

- It _has_ been 2 weeks.
- Review comments have _not_ required changes.
- Sending a no-change patch is just as much email as sending a ping.
- It's not content-free: I'm asking if you're going to take it;
  patches have gotten lost in the past, so it's a valid question.
- I'm not interested in other subsystems, I'm interested in yours. :P

You've made it clear you don't want me to pick up these kinds of trivial
patches that would normally go through your tree, so I'm left waiting
with no indication if you've seen the patch.

My normal routine with treewide changes is to pick up trivial stuff that
has gotten review but the traditional maintainer hasn't responded to
in 2 weeks.

Do you want these kinds of patches to be re-sent every 2 weeks if they
haven't been replied to by you?

-Kees

-- 
Kees Cook
