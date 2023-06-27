Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249CF1306E
	for <llvm@lists.linux.dev>; Tue, 27 Jun 2023 19:29:49 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-bfee679b7efso4813714276.0
        for <llvm@lists.linux.dev>; Tue, 27 Jun 2023 12:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687894189; x=1690486189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWTyrHWo3DH4WeJQJV3ZkbmX57NNeA9KlEEZWcqodA4=;
        b=kmfeeAkPPfIIrgdhOd0Wz4grrEpQXcJmqHZ9HzQ7fuysvUZaCgExi22n1Bd0FYEXa2
         TjrE9q5kPQe+asD1MQsO/KQw9jNjLqwHALeKqPUWj3pQmhn7/nSkIGlqf3z/X61xjh/R
         myalWcsWU5YNZyIHwdJgQSDQVhJoGUC/LQINYA3cW8I1OueqF48HhicinqWQyRKHq2Yc
         9Wj0GmeNw10ae8KihoCV4p3gfxAoiPGK94CwRt0+F9xfmGWLsi9wv/evVGUy8lhHyUv0
         1yQA4cZ+v37F/eLCdaqLgyGyLvqzjd6JdzNw9iBMXhQcf8D62KtWLIQNh1mswSGQ/KSZ
         Znkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687894189; x=1690486189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWTyrHWo3DH4WeJQJV3ZkbmX57NNeA9KlEEZWcqodA4=;
        b=A7bz6UfWoon1MBzIELgBlW60WhBP0Eu6T8h084/D2UWbhbaNWgcXHI+xVBmwFvCJOA
         LxUq0+OkGNvSuLevb4rjw6ItNpCgFETM2S7QQ8tPthHso6uiLdBJIWtGadrrDj/6PHUd
         LXrUZA/tqaae+fil1eofgxgkCE+JuIFuoNXxJpUlAyIBEvQsDGbbVEgAuzD0qPvNxpT8
         p8OUwjwiYQXglvEuP3/Dv4WZsRBBwbcNBaElnwbDnIKr07HXS9AEF3MSnlMAbVc4s6x1
         xdhrIR2IJSTdgtrzCpaRyLl1CSRUgN9aGoQJcy9VV2v8hpKpIwgSRMUJN9KTBRRRfWSh
         0BCg==
X-Gm-Message-State: AC+VfDzvXVMaNc1vFlEJzQK1prPOcmsrlLf1zWyrbhhvorpWghYyfecg
	obWg7QqE/ZgEiDoYC0GrR+26GlZvPFS2/g53d/Y=
X-Google-Smtp-Source: ACHHUZ56nLE7/aI1LmL+DMoeX705IRHIayduaPNCBJtfc5MDE2Q8Y9FjW+iOMmg2yR7Tp6iZIqy4yeFOLbNspBtvAXk=
X-Received: by 2002:a25:6fc6:0:b0:c24:dea:a5e1 with SMTP id
 k189-20020a256fc6000000b00c240deaa5e1mr6059171ybc.3.1687894188822; Tue, 27
 Jun 2023 12:29:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230624002708.1907962-1-maskray@google.com> <ff7c875a-8893-9b7d-e2fa-200f1601e666@meta.com>
In-Reply-To: <ff7c875a-8893-9b7d-e2fa-200f1601e666@meta.com>
From: Namhyung Kim <namhyung@gmail.com>
Date: Tue, 27 Jun 2023 12:29:37 -0700
Message-ID: <CAM9d7cjyKmKk+z1z8qatjaC7xwwJa_PFE0DJzJ=_mFjS6taz_A@mail.gmail.com>
Subject: Re: [PATCH] perf: Replace deprecated -target with --target= for Clang
To: Yonghong Song <yhs@meta.com>
Cc: Fangrui Song <maskray@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fangui and Yonghong,

On Sun, Jun 25, 2023 at 11:25=E2=80=AFAM Yonghong Song <yhs@meta.com> wrote=
:
>
>
>
> On 6/23/23 5:27 PM, Fangrui Song wrote:
> > -target has been deprecated since Clang 3.4 in 2013. Use the preferred
> > --target=3Dbpf form instead. This matches how we use --target=3D in
> > scripts/Makefile.clang.
> >
> > Link: https://github.com/llvm/llvm-project/commit/274b6f0c87a6a1798de0a=
68135afc7f95def6277
> > Signed-off-by: Fangrui Song <maskray@google.com>
>
> Acked-by: Yonghong Song <yhs@fb.com>

After 10 years of deprecation, time to change. :)

Applied to perf-tools-next, thanks!
