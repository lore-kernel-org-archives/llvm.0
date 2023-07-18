Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A397D50F
	for <llvm@lists.linux.dev>; Tue, 18 Jul 2023 17:15:00 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-635decc135eso32709406d6.0
        for <llvm@lists.linux.dev>; Tue, 18 Jul 2023 10:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689700499; x=1692292499;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49rureUPbZzpudlVM2zneRe6HyWwlUbk8aE+ndrnLuA=;
        b=wZPMHBQa38uiHSyA0hsvxL0lXMKKx1+1kKb1VUBm0CDZ1I//sTfRoiFPTdoa02MZ+Q
         CDL38rxEgD+ezJik+WZNyf0/NIpzYv43e933YM7hdS+NhpfVjf8SIyZqB11RMZ9zlOia
         amFNtGO2Eks82pNuINQGf51x7tkhhqmOELeg2wjnjOEc3ocN1rYrajoz0N7Qu8/97O5U
         l3FWNesOXYlGOqFdFk4f3VenH+Shz4IlEcQr5hnejnjhIqw4ykyIngC3gt40q9ZBh3eg
         cTK8FY8/pbqafvU2fgmckPWofcKGfZlKrxfh7ajxYsv5pegHF0CsEWG2ZbUedZ9CC8Pp
         H9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689700499; x=1692292499;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49rureUPbZzpudlVM2zneRe6HyWwlUbk8aE+ndrnLuA=;
        b=kQ4xBk8NPtCi9MHujkY4uwfKYcZFNVFDim4W1h8xUjLfUmgeYxERSNve/GczsFSDHO
         gZUVZz6Mm2GhX0vW1hB6+O89mfmnoRiFqCQgAYbLfjbBI4JedM1mtrWMkK8AM8qGsbPH
         CeVBz0np2W/jM64HK6QwZnV5Dlxe8SrC1eBcv0gixi1uSfrYLWPeFQ/ejoBd10JDr2M3
         qyK5bt3pQIZtmC95KNW9fAGiVYxQipkcZEWagresqoMMHg9Tb8f5Bcs7ORJAa7qMU9lN
         eJiQz+icVmJWsjC1xDXVzdpJ1awsfcDTuhvAg9kPpe0dlGIkEMhI5uJWunglPDlEoZoB
         /4jw==
X-Gm-Message-State: ABy/qLaiQiSAbN6hlnKl3EB0CoznU0fpbPTjtbqcvFcwnStrt69DuNZv
	xkXi7fqLPEzzPP1TQhaPa+1nvFAmiFbkU3Q3k32YaA==
X-Google-Smtp-Source: APBJJlHgr3AglGxCaL8r5sAYNbCPfzT7KYHhnJVf/2YnXexSQAwXtV5odoGuvIxp+DJPnZ3x5TdOJZkHiVhmOOE7O7A=
X-Received: by 2002:a0c:cc8c:0:b0:625:aa49:ea0c with SMTP id
 f12-20020a0ccc8c000000b00625aa49ea0cmr15312379qvl.31.1689700498934; Tue, 18
 Jul 2023 10:14:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307180750.Dk6xL6nG-lkp@intel.com> <20230718171025.vn67ydtjifawkvqo@revolver>
In-Reply-To: <20230718171025.vn67ydtjifawkvqo@revolver>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Jul 2023 10:14:47 -0700
Message-ID: <CAKwvOdn1Uc-xZk81Adooq0tVHo6M9Jn6=OXhiJs07X3nrJst+Q@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 209/215] mm/mmap.c:2430:29: error: assigning
 to 'lockdep_map_p' from incompatible type 'void *'
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 10:10=E2=80=AFAM Liam R. Howlett
<Liam.Howlett@oracle.com> wrote:
>
> * kernel test robot <lkp@intel.com> [230717 19:36]:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
unstable
> > head:   75ac3c8cee9c94691bc9001fcfb6214ae812bfa8
> > commit: f40b24c7c416b304b93115d66d02dc54e5d2f7d1 [209/215] mm/mmap: cha=
nge detached vma locking scheme
> > config: um-allnoconfig (https://download.01.org/0day-ci/archive/2023071=
8/202307180750.Dk6xL6nG-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.gi=
t 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
>
> Just a status update on this..
>
> The above config works with clang 16, I will reproduce it with the
> periodic build of clang 17 once I locate a copy.
>
> The llvm repositories currently don't have 17 [1], so this is delaying
> the reproducibility and fix for the issue.

They do, see the second hit for `development branch` on that page.
Thanks for testing!

>
> [1] https://apt.llvm.org/
>
> Thanks,
> Liam
>


--=20
Thanks,
~Nick Desaulniers
