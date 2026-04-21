Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A5D2F5468
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 17:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792534; cv=none; b=Ok5e7oIMu2rSRoOIbOP1sJq4s2V4pQADH8iIxGYiHg8yLY/PHp4aF89tkNjFOq72i2q4Oth75YCgnyE4faNu/fKYnU3Apzg0mdfln/dYrg2hRjga7xmiai4SVOy3wL27l4MZLHlRERJhvlE8Od8oAo57hNhwWT4/ZEeZLl9Afn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792534; c=relaxed/simple;
	bh=0CPNtG9KaV/mxXgWOlyTcx7Q+sWj/Qaq3yAUy0GQXkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eI/Wxyh8jOchQ+mjYhY3jr5oevn1JG5gcbzAJw/CfsDWuUW5At0CJ1v2kRJfdj4wfWKZFCQIMI0eUOHorv0NG0rPC++wX3Qwo1h7VQNpr/usmT/SHnw+A/FnQfnIJmGnB4E4eJK5A1jdtIYNcehkdfPlosB45TEBBNz2Dzmjx6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkUKG9to; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkUKG9to"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c76cce85bd9so1674678a12.1
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 10:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776792532; x=1777397332; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JNWTKUwnrU4f/1KWLuTJhziy5RXD7g4YKGqyBo+QdTo=;
        b=VkUKG9toC2IiRxMZ6bO657iZ77bXY7Q6RgLmV9sFIhXvc8TKFLwLzQLteDXa2smmCl
         bUoh++UXeEtFyTeYuJd0/OeEXj6h+v4nSO0ktRFM5ptKGiYcFfGzeBxoE1+1kO79P4pK
         IYE/hfxUnzLZt7un+DJHbrxV14wgSICVnAQqPGP8DKI211dYYRj7r7Ab31TAEBP3DgJK
         zLtzNk/6J+kc/PZfIYfUEbg7dzzmi0Eoe8jcLag1/KRjzJTfDYY12zrMvqLT0MdCnciO
         xU4xolkHpCDAActJ7b4SvIVkhgLt1OHYFFL42+pVrg/oQJs25MMrNIyKDo2MUbldx0ox
         0DIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792532; x=1777397332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNWTKUwnrU4f/1KWLuTJhziy5RXD7g4YKGqyBo+QdTo=;
        b=fkTtkHZMDaej8r7ZPnpljo36OOOl1eAJ0BQSSexF9PVctpcJkUJ5MoTTuWAx/HpuUI
         NN+Q+kKWJnm51A7lQHylDg04HNPYyPEgOcxwtpkx0xcKE8K/fHgdNjLI0lU7JQjSmMvi
         kzfeaJ9102j+/Srm6e23oGr12iGM6q8Dj+YU42pBo0xGe0JI5egFkIPj/tCISNsIeo4r
         hePVBHN+YEva4+CWtgbVHvg0Ev/qaP789cvR0MBO1KBHQiGpJ4VUE2FY2Jlk6A7kt/ca
         V4NuncQQRrpeszLnIIh1zoNSfywVptITUNJ63/Mh3mAiBSL2R2qaq/+e5DmFtbPeyZfi
         wZLg==
X-Forwarded-Encrypted: i=1; AFNElJ8GFmgUmUjAeDSEKl2MRKk7jTFOXqyaH+QiOHBxOqbu4fPjM4ZBlPh8CrPWihB4cslz9icQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzI15kYFYaXpnCth4eClSsneGcivGYQgwKVRT1qAA9FWUgRUAJj
	1E2FwJs9YfLttqsk9gZ5IT96gk2D+U/mIaFogukaO9l/MnlNrFzpuiZa
X-Gm-Gg: AeBDieteMoR08CMN8V+jwwtTH80OvcCWB43D5WrPt3RMeK1wN0YnyrmTdxhseo7tBxQ
	OI3Ggc4aesfVdpLOZDKSsgY3nXdIMMR4g9O06gTQBxt8o15T1QL2hFUjGExs6XEVah+BRROEl9A
	f/tvozeLiTMFqhIvBw6/5/4xfb+sk+/9rRVyr8DPMbOaCNDZwinsJ/Oajp0Ygcp36nqdNAPzToe
	oog5QUceb0lJyycydlvyipRmUETeejZlFaS27XczjF3eM7/oJ16ZYVqapNpVq2JtzbO/Q6gq0GE
	TZVVMxzbGlPbl1GG2dCmF5Ua1hb3RWT47pRDBG3s7y31ePsnRJeFhI45jnQ4Z+jjvYrEH9vDIf4
	hxdlXuAYOu0ce3kJLdLHOqCnN1acghWIhxn6q/DXrdO20oHizoP4ZW8gaK/TK1Hzn/Xg3QQIN2U
	40nrNPsFNu1MQNdrmOm9GT1e1M/P0DJtPj4ZC4qIJ+OWZYwjrfDO77DoD3iP7yX85L9oan+dWoq
	QyvOcoNQA==
X-Received: by 2002:a05:6a20:734c:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3a08d8a21bdmr21718680637.35.1776792532369;
        Tue, 21 Apr 2026 10:28:52 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703ddf8sm10961055a12.28.2026.04.21.10.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:28:51 -0700 (PDT)
Date: Tue, 21 Apr 2026 22:58:39 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, 
	ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
Message-ID: <aeezhtH9PCaqfg7r@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260417152253.2312961-1-mkchauras@gmail.com>
 <20260417152253.2312961-2-mkchauras@gmail.com>
 <aedFgEicDW6LAcuq@luna>
 <aedJGuF9P2V1lOCZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aedQ629D0x-5KuKw@luna>
 <aedpk1iaeYyKPSOI@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aeds6_8Mr_w38oYI@luna>
 <aeec_IzVJwlfarN5@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72n57hMF+0cATWgUiE1ccqJPwMYw_KAu=3PNJdG3=6yoDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n57hMF+0cATWgUiE1ccqJPwMYw_KAu=3PNJdG3=6yoDw@mail.gmail.com>

On Tue, Apr 21, 2026 at 06:00:50PM +0200, Miguel Ojeda wrote:
> On Tue, Apr 21, 2026 at 5:54 PM Mukesh Kumar Chaurasiya
> <mkchauras@gmail.com> wrote:
> >
> > The stable support is available on nightly.
> > Refer https://github.com/rust-lang/rust/pull/147996
> 
> That PR was merged for 1.95.0, so it is already available in the
> latest release, no? Or do you mean something else?
> 
> Thanks!
> 
> Cheers,
> Miguel

Hey Miguel,

Yeah that's what i mean. It's available in 1.95.

Regards,
Mukesh
