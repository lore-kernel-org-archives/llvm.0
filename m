Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A2D17C2
	for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 04:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JzaPLRHW"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6be1bc5aa1cso3574372b3a.3
        for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 21:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697689992; x=1698294792; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DTvrXbcdzsD7YSLg36ffe2oHA15KfNm4vV4kTMiGL9E=;
        b=JzaPLRHWFNCldhBMRdsKWqhMwirZorZqDljduroVbwYPxIAGk5TnBeWiERf/lmSLYx
         mqIqUa95g7Q79bipqdimdQr0/1hZiEigh1JzauLHF4hS3FlCKALZsDUryXp0d9Tpw6Yh
         nNPPbflvr5OI0XrtPOSs+cQ09cbDBaiSv5G7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697689992; x=1698294792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTvrXbcdzsD7YSLg36ffe2oHA15KfNm4vV4kTMiGL9E=;
        b=teJujXwTpbsFRUi338lCh+v9LtHQ2FcO1mrjeTZm/79ZBi2+3xgJJ3PA3wQP7ekvtX
         4/NhP6fdrQZaqfxCfdwdj0r463FjG9z5QPfHbYWTA7kJDsBFXjTnvJxBkpSuMkUwg8AV
         X7E8wDLupZjskXSRxIscNp3yhcGJJLsSzqnuayYE7tyvOFH+t2VncU2ZS44AGIwckwNk
         cCKf3LMT5uZLESRhMZfdKhVTj+mVzLvFJlzDSzFYGPG6ur4k1Cp/fwfzafQKsNYfoiEL
         V7hELLYIzWISMvA2wkzDJD4QdTiiOmRwr6k1UyOQTqRTumPr2zomOC5ev0B/uGlQsHFP
         IghQ==
X-Gm-Message-State: AOJu0YzF6kWFRINrGYcovO2jDKTqaBIkN8M56j3/TkYzvqbqJUEbTX6x
	8QCXD6H1Lgy1Vb+jOTHhvIQnIQ==
X-Google-Smtp-Source: AGHT+IEsnYPHdzEqfSrZlO8TbPOIQg1bWrdfxEfkBVjsJXXB9B7SRMVs52VWeTNlIlF0Gmj5M1z7iA==
X-Received: by 2002:a05:6a20:9155:b0:133:f0b9:856d with SMTP id x21-20020a056a20915500b00133f0b9856dmr1215010pzc.17.1697689992452;
        Wed, 18 Oct 2023 21:33:12 -0700 (PDT)
Received: from google.com (KD124209175111.ppp-bb.dion.ne.jp. [124.209.175.111])
        by smtp.gmail.com with ESMTPSA id fv23-20020a17090b0e9700b0027df6ff00eesm509871pjb.19.2023.10.18.21.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 21:33:12 -0700 (PDT)
Date: Thu, 19 Oct 2023 13:33:05 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Usama Arif <usama.arif@bytedance.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	muchun.song@linux.dev, songmuchun@bytedance.com,
	fam.zheng@bytedance.com, liangma@liangbit.com,
	punit.agrawal@bytedance.com,
	Konrad Dybcio <konrad.dybcio@linaro.org>, llvm@lists.linux.dev
Subject: Re: [PATCH] mm: hugetlb: Only prep and add allocated folios for
 non-gigantic pages
Message-ID: <20231019043305.GB14965@google.com>
References: <20231009145605.2150897-1-usama.arif@bytedance.com>
 <20231010012345.GA108129@monkey>
 <20231012000327.GA1855399@dev-arch.thelio-3990X>
 <20231012145318.GA5127@monkey>
 <20231013001203.GA3812@monkey>
 <20231014000450.GA253713@monkey>
 <CAKwvOdm9xKGQzi6_j=gGZCEmKJe6b9o8+jen1oEeAhyjcaSnxQ@mail.gmail.com>
 <20231018222003.GA21776@monkey>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018222003.GA21776@monkey>

On (23/10/18 15:20), Mike Kravetz wrote:
> > I think you need to initialize h, otherwise what value is passed to
> > prep_and_add_bootmem_folios if the loop is not run because the list is
> > empty.  The compiler sees `h` is only given a value in the loop, so
> > the loop must be run.  That's obviously hazardous, but the compiler
> > assumes there's no UB. At least that's my limited understanding
> > looking at the IR diff Nathan got me in
> > https://github.com/ClangBuiltLinux/linux/issues/1946.
> 
> Thanks for looking closer at this Nick and Nathan!
> 
> I think you are saying the compiler is running the loop because it wants
> to initialize h before passing the value to another function.  It does
> this even if the explicit loop entry condition is false.  Is that correct?

The loop is getting promoted to "infinite" loop, there is no
&pos->member != (head) condition check in the generated code
at all (at least on my machine).

I wish we could at least get the "possibly uninitialized variable"
warning from the compiler in this case, which we'd translate to
"hold my beer, I'm going to try one thing".
