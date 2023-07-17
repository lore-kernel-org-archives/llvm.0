Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C15ABA5D;
	Mon, 17 Jul 2023 18:09:01 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-55b83ae9be2so3721932a12.2;
        Mon, 17 Jul 2023 11:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689617341; x=1692209341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LkJFntKWbGRpv5Aq0XnB+WBvdM8xqNaNAOxWsG/ttJc=;
        b=JYfdQdmjmQ4tShNoTk8QuVCu+Wzv1ElsLHCJEBcggEpe20lS3Vz0E+PAhNFG7Lir0I
         LaH29W8GwcsTLY7MOdU8qtlPN9EHiydRdJ/tAhdqFIFp6XZ3ptzNyuiqhr/iuyhSdi6w
         RhtU3BRInR64hZo/2HnnU6Qz/Y/wSlEu1IOCDlYn1Tlqdxw4XZ0UNoEw3j8b03TJMbu3
         xNpHSSdPQgimdzbUq8LWACZit2Lf6rpVNylijSpXfRfwtTKbT/CX4Bw6/JqNo+RIfGdC
         iYswWScbX404yuAzD8wvr0yrj4czeHJ9hpBaWV7x22FaZkJIwU+YN4S13HohJkVi4T38
         ZKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689617341; x=1692209341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LkJFntKWbGRpv5Aq0XnB+WBvdM8xqNaNAOxWsG/ttJc=;
        b=l+oLJGZPTaTQhawTnTiQXg8jPlDwRwDM89z514Gc63nZIV2OxbozGzX2bxJ6vcEEDA
         z3ZfNrjvajTEdKuBz13S/sIwXTIbn+kD3oIhTbm08ZLh0/Xo+ufz0antSoiQKQzuCYKo
         WtsC8ogq7iOuaX2cFnTcEOOkVC0zOKnOxLeuPRiJ7cHjYO7+Cf4tNdB8UsxUELkz6P9n
         Ly20qifIBX0sVWqBEhkuycRZdFFHx77xZ6GN37eEPQYdl6FSt39Ncqplp5u0EzoSA2kZ
         zuDCaVoVWHvvXmUqIaNfrr8HXiabaJ4Pw4Jd69Dg0SHhgife8GWvU85eHlfk4v2sgBG6
         fLvg==
X-Gm-Message-State: ABy/qLayglWIk7BpVkasUJxFp8GNDS9RkEgRHq0qcW634IaE4xyHvSyv
	WtNS9J4ER4Yi67AiaRq7hqc=
X-Google-Smtp-Source: APBJJlGUo4U5ojubaCUgkg9GuGZRoSrhAhPcphyxYJZPsULhCCAP4ZvI6gWHkQZ6dRdI9/2NsQ/gkg==
X-Received: by 2002:a17:90a:dd93:b0:263:4962:94c6 with SMTP id l19-20020a17090add9300b00263496294c6mr11842336pjv.20.1689617341230;
        Mon, 17 Jul 2023 11:09:01 -0700 (PDT)
Received: from localhost ([2607:fb91:1ee0:54da:ec41:ee39:e52a:3118])
        by smtp.gmail.com with ESMTPSA id 95-20020a17090a0fe800b00265dc26d8dfsm5697248pjz.27.2023.07.17.11.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 11:09:00 -0700 (PDT)
Date: Mon, 17 Jul 2023 11:08:57 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alexander Lobakin <alexandr.lobakin@intel.com>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: lib/test_bitmap.c:920:2: error: call to __compiletime_assert_348
 declared with 'error' attribute: BUILD_BUG_ON failed:
 !__builtin_constant_p(res)
Message-ID: <ZLWDuZ5Q5qBnmS25@yury-ThinkPad>
References: <202307171254.yFcH97ej-lkp@intel.com>
 <ZLUSG8bNnSqT0LO+@smile.fi.intel.com>
 <CAKwvOdnUjAXg4VRbCBKUOZDCKs-=5aA2-ef1tFRj-P=-1bBjaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdnUjAXg4VRbCBKUOZDCKs-=5aA2-ef1tFRj-P=-1bBjaQ@mail.gmail.com>

On Mon, Jul 17, 2023 at 09:35:49AM -0700, Nick Desaulniers wrote:
> On Mon, Jul 17, 2023 at 3:04 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Mon, Jul 17, 2023 at 12:42:57PM +0800, kernel test robot wrote:
> > > Hi Alexander,
> > >
> > > FYI, the error/warning still remains.
> >
> > Alexander, either you can escalate this or just propose something to discuss.
> 
> https://github.com/ClangBuiltLinux/linux/issues/1874
> Sorry, a few more fires have popped up in the meantime.  Regardless of
> changes to the compiler, we still support many versions of clang for
> the kernel, so we'd need some workaround in the tests regardless.  I
> saw there was already one for s390 + clang, but from this report we
> will need another. Feel free to use that link above in comments in the
> tests; we will clean those up once I have a better grasp on what's
> going on with the compiler here.

So, it's:
 - not related to bitmap code,
 - not only s390 issue, and 
 - fires with CLANG when GCOV and KASAN are enabled together.

Is that correct? If so, I can disable the test for CLANG+GCOV+KASAN
configuration unless the above is fixed.

Nick, can you please confirm?

Because it's a build breaker, I'd like to have it fixed in v6.5.

Thanks,
Yury
