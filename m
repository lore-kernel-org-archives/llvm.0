Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70B52232A;
	Mon,  6 May 2024 22:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715035648; cv=none; b=PLrsHrSw339vGyp35YKbQgoJ1y4ukxDtMHm+Q1NUF7ddSNp7mowTLu2NR5zkOZIOCR05xOB9/RlBOZrF4w/ldM0Li4WxS0zh0pdnysDq0SO0ld1PFcsDjI01cySdwHiw30ECs97Nn6EJRU09H4p/65FcUhuCZepqd/17TVSkuQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715035648; c=relaxed/simple;
	bh=xah3eiBvt2IRFNfHQzMpUEiliy3kzKTT1T5VLMfv/Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUlI3I2wwgxLFmvO4LJfZPWzQfFpN8tcBvqNKBMgVb/FfJY4RVVM7t3kjyovGAxvE+w69jy0gOYCqN5mbD1IbEW9EQnpxeca4f5rdrheAqCxZQuxaxzQGzO5MoXtmuruSXplavWDdXAbKnFHFmYvtghbEFA3S/Vzv1NkQTrx2U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwK5f46w; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwK5f46w"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-de604ca3cfcso2476157276.3;
        Mon, 06 May 2024 15:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715035646; x=1715640446; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I5ntu6mt3uy8mRpEVTg+tphF2bUMaNINXCqe+HKq8KM=;
        b=FwK5f46w0GwtJ6K4/A41Et1G0ZbeATIAZF8fCeYyqe5QYXJghkEmuIaVFbgPvHadND
         h9xSnIbY6NZoE0hdJPlPUmuqXBppcBImzW3Dt9e2AsKDjNJINYPcHBeNwih+gO/Bgbqd
         lZrtrx0xuKmRzhDAJZKrEVU3qy4Q1aSVJGZV6YlmYLdh7XlU6w5/hrfYgmMr5xAn8ZpM
         JOfAZyN3x0ABSpu2LVE2fR2oRgiNvvlsL29XwKkRFsZNwBuHOeAzm6Yx+V1BNALJ6Zax
         cJE+6wAHxk96Xvs8D7E/1zwLoF9+tznZMPTue5uvf6as7xb8AO/jxXkYla9TDKkgR/9e
         zRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715035646; x=1715640446;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I5ntu6mt3uy8mRpEVTg+tphF2bUMaNINXCqe+HKq8KM=;
        b=Jgx14Zr5mCHHq0WQvAguxkRMMCip79dWaftkBbAT9VGozvkauO9xzL+uSX8wo9uHfx
         plqLdzsXAMsbWgGbY484IgZxBYe3Y2rzkD/vQ2bvda6NKj0mKcYHSODFPXagY3M673el
         zIpffxj+udA4CPgPraheR1GqVsjc9uP+qfH8m5czK8a6b6WAlqRHJFBKc9Z/DiXbPEaB
         5LTjv9iEz3dZHfu+NspyaHklF58oHmdQzpEQw0QqKmuOCGo1LL3r0QSWvsaixhmD0EUL
         SsGhBGWEf7rfYiVQ1A6BguKOBAvtyHXsQ0klFVd/JGiwf/RMz4qAOnlmpwSVuDNGEP9r
         ne9w==
X-Forwarded-Encrypted: i=1; AJvYcCU9WXUqwgEIBUiCyld9evP9Tak9TLu5JVcQm80H3/l3RofnxJIALV77XjhLYOZOzQYUumHcFaLzhJUCJDB1aKf0EL9HKpVXrhgWAI7JV+1B25qagptsiJ/zMpNugiWnhgjSdEw=
X-Gm-Message-State: AOJu0YxznBuHKNaDjvLhUGiRYisNJbkKAxFmBMkPRhlcEuRzo6gjhv61
	8/qw1PAKXUN161RS6bB1OISUcMD4O+vTcmaHygOCG2lF1Kr8ZBGds5VGpQ==
X-Google-Smtp-Source: AGHT+IHUc8DBtbV67fJZi8Y9NrtxoyRynSWwehFJo41jBgIVvNSLEa4TEj4bLVyJeXx9xajuAs55GA==
X-Received: by 2002:a25:d0d8:0:b0:de5:f817:abe9 with SMTP id h207-20020a25d0d8000000b00de5f817abe9mr12081469ybg.51.1715035645741;
        Mon, 06 May 2024 15:47:25 -0700 (PDT)
Received: from localhost ([2601:344:8301:57f0:a110:7baf:6acc:de85])
        by smtp.gmail.com with ESMTPSA id w13-20020a25918d000000b00de6134b2c3esm2255582ybl.24.2024.05.06.15.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 15:47:25 -0700 (PDT)
Date: Mon, 6 May 2024 15:47:24 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] lib/test_bitops: Add benchmark test for fns()
Message-ID: <Zjld/ImGmyBHTLO4@yury-ThinkPad>
References: <ZjQ/JOpcdgWZXo0y@visitorckw-System-Product-Name>
 <20240503041701.GA3660305@thelio-3990X>
 <ZjSSylciH+qJeEEG@visitorckw-System-Product-Name>
 <ZjSUk4vgsQ63wfcn@visitorckw-System-Product-Name>
 <20240503155401.GA3960118@thelio-3990X>
 <ZjVdbavKgDo8a0CZ@yury-ThinkPad>
 <20240503222338.GA1908482@thelio-3990X>
 <CANiq72mJPPp=H6qb7sG1K1hxR3uiHA9+WEVAZkvymSt_dW3CbA@mail.gmail.com>
 <20240506175209.GA1425562@thelio-3990X>
 <CANiq72=mSafSJH1hab57LxYfyj_BD7UOtyAerOT8S41MD-MnAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=mSafSJH1hab57LxYfyj_BD7UOtyAerOT8S41MD-MnAw@mail.gmail.com>

On Mon, May 06, 2024 at 08:08:41PM +0200, Miguel Ojeda wrote:
> On Mon, May 6, 2024 at 7:52 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > No, unused can be used with local variables, used cannot.
> 
> Yeah, sorry, I meant `used`, i.e. it is that one the one that
> constraints the combination rather than `unused`.
> 
> >From a quick look at the links in `compiler_attributes.h`, `unused`
> can also be applied to types, while `used` cannot -- it is another
> difference, but your sentence above already implies it anyway. :)
> 
> Thanks for the correction!

I have applied the patch in bitmap-for-next this weekend.

https://github.com/norov/linux/commit/eb21fc0c96b48d1e779a0ab16f9165a3e0cd76ad

Can you guys please take a look at it wrt the last comments? I think
it's OK. But if not, I will resend it.

Thanks,
Yury
