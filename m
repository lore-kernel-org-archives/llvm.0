Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F4779F8
	for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 17:41:46 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id o15so13712925wmr.4
        for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 09:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=54IpTTLCvVxPXX0cuxhQWkS9k8SzAShMuo4+1zTXdSU=;
        b=aFSBCj+Oeq9NCQMXQH6o+/4AuCAP25BuIZNDqxPfUDr8KwfVSHky63qo+yVM9P65lu
         cgcOa1KUP9RQOB3hTDbV857Lb+30VhXq3Nvz0oI03HX8p+yoFfyXerazEU76tuTbVC6i
         Yu6wrxI0q5DTviXs5LTrvjp2pRHiUuTQSNqyfA/wlmTWxfG1uSJ5/Or1d6aijdlpqKmw
         fIk2S0CJI4RNBjBS7tX4Zt6D+dv/xil05Tt5Db2kxg7WzKXn0xTYA1j66FUAvIeiXN7D
         zxxbwLQFon6IHRyfGaVbsqehpGpXG0sQ1FxJs2V8zj93ymxBxKcpTMg8gOlB17QWVy4f
         VuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54IpTTLCvVxPXX0cuxhQWkS9k8SzAShMuo4+1zTXdSU=;
        b=ozL8EMzy+eCKDtN59Hc5FfYrLNfkZRFlfLxlwACwwlPX2XkdD+cSr6IJbRs/jeKmcg
         F1R8WtoumkCX5fQWQIFfZaK8PkQqOyMIQ/BIMiAmzHQtMTOWL3aT8Dn+GBuzWBuXbEYj
         uQgGsKMr6q4mDqs5CcZGihVPpm9bEsV4JKgi0J0Pe8TAFGg2o5SXxBR3xZG2a9m8S4Fo
         Ecz3f4vRVKitM+OqBTX9b13vWMaVQ6RrWmVE1MoreUDgQLv1DM5dZdwZCDCqEJtrg/y2
         pyWAHaPB3+QRO0tkZmdve8+pM1xoB1IezHOp4HgDd78ejHuwu2Uy2MAOtX/LDzt9UKfh
         6Ccw==
X-Gm-Message-State: AFqh2koJJl1x45xvybi/MIh+8v38qKEO2GEnR5KYNDtbnjJnUMd+6mow
	Q4CTvW8rpg6c3H1ozPnIOm4iz63Fh7aDrjfRWMhx2w==
X-Google-Smtp-Source: AMrXdXuFZ2C7o7YbTwxkOSStFcLhjn763mSHYuDCjoxTnyQK4NOxZsXpWrL0qO3bnQp1ENxkqUNAH2M5UN1hDKAeMiI=
X-Received: by 2002:a05:600c:3b04:b0:3d0:50c4:432c with SMTP id
 m4-20020a05600c3b0400b003d050c4432cmr3955313wms.67.1673545304812; Thu, 12 Jan
 2023 09:41:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230105090155.357604-1-irogers@google.com>
In-Reply-To: <20230105090155.357604-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 12 Jan 2023 09:41:31 -0800
Message-ID: <CAP-5=fUmJutjku92vn_6OxLJZKJ60yhkS_XLbL7C7p_ska+xZw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] objtool build improvements
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 5, 2023 at 1:02 AM Ian Rogers <irogers@google.com> wrote:
>
> Install libsubcmd and then get headers from there, this avoids
> inadvertent dependencies on things in tools/lib. Fix V=1
> support. Clean up how HOSTCC is used to override CC to avoid CFLAGS
> being set for say gcc, and then CC being overridden to clang. Support
> HOSTCFLAGS as a make option.
>
> v3. Is a rebase that removes the merged "tools lib subcmd: Add install
>     target" patch. In:
> https://lore.kernel.org/lkml/CAKwvOd=kgXmpfbVa1wiEvwL0tX3gu+dDTGi-HEiRXSojwCLRrg@mail.gmail.com/
>     Nick rightly points out that:
> WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
>     became:
> WARNINGS := -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
>     losing the EXTRA_WARNINGS which v3 now adds back in. Previous
>     testing had added the warnings to the end rather than the
>     beginning, thereby causing unexpected build issues that aren't present in v3.
> v2. Include required "tools lib subcmd: Add install target" that is
>     already in Arnaldo's tree:
> https://lore.kernel.org/lkml/20221109184914.1357295-3-irogers@google.com/
> https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=perf/core&id=630ae80ea1dd253609cb50cff87f3248f901aca3
>     When building libsubcmd.a from objtool's Makefile, clear the
>     subdir to avoid it being appended onto OUTPUT and breaking the
>     build.
>
> Ian Rogers (3):
>   objtool: Install libsubcmd in build
>   objtool: Properly support make V=1
>   objtool: Alter how HOSTCC is forced
>
>  tools/objtool/Build    |  2 --
>  tools/objtool/Makefile | 66 ++++++++++++++++++++++++++++++------------
>  2 files changed, 47 insertions(+), 21 deletions(-)

Ping. Relatively small set of patches, with Reviewed-by and Tested-by,
would be nice to land. Thanks!

Ian

> --
> 2.39.0.314.g84b9a713c41-goog
>
