Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE2729CA
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 22:17:54 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id p8so591707ljo.5
        for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 14:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dsxFBdm2QviBZ29N5dveyQzOQKlgfiIrc+0yxADMNCQ=;
        b=NXGLxSCpObD2flRKPbCq9IFPdHnTLn2G9uiMQbiGfRWzwaeJ2bD8taKQdDhT7vmYJQ
         XKN0OrMjsTFtN4wpAuKb0rktrM3wvPlOc/x9PIKTiD8RUbXS7EVGu5eZV8Z593A+RmdE
         f/WyA0N9jfdkw5Fk7b/SMzwK11A0I6YzbkyPgQz1mxFDG+9fP4JmVDpjEC44R3vUzr8R
         Q3z5exdX1Y33rGrCOUViS3xHKetapJhi7PURL5aohZDHl9JqfMHvdqUGgZtD7eupsRMU
         4RT7vvBNqyV+J7FlzlcUCHul5Xo7HG73kaTCwJR/I68a5eFShE1J6AwN1ZfI4UMCSl/M
         SBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dsxFBdm2QviBZ29N5dveyQzOQKlgfiIrc+0yxADMNCQ=;
        b=g1Ha5ZEF+W1Mizz6iXgGmeTdv7sAVjGjRHjA6hyYSyLYRfki1fq1F1PK9hzMuofNFa
         VAQAYVTOb6HPsjaSmoT/MzB2FKCO9ofWLVnlszT9x0tAbG/6SIlS4UpqKyY9SpF1bNF/
         2BGgB24rwt7pt7IIxxcVGvx7GaBw4I5ivQ5bZKNOhvWtBrgTp80X2ls7irJtTEbpTZ85
         W/SZYNQ9CYu2fbDrcqOkZPkZhjoyp9jYfgwnVKjQ3Q8nApaZ6lyQ865Ul9gJMZwUD3oP
         /yuclrsI1VE5CrwAa0aCUTuotGL5VAZfc/36cdXqM2S5fSnYxhJ6eTKjVWP89iFQoBKQ
         ovBA==
X-Gm-Message-State: AOAM533gdm5nZjpzh2aQxFsQ1L4jWiFCtuXYFcwA7FGOzw3QPGU4MuLx
	iDjX6KpA13ND1HEFDZhmLvtLJExprHozZ8A1wQGmlA==
X-Google-Smtp-Source: ABdhPJwwMIZzbtN/WFjr6/Ly3vHEn6ix3T31OaNoEmwDcGRQg/3sYZ7JNkTLTnzGEzM47tPaVs915sWc4CTh4BE+7YI=
X-Received: by 2002:a2e:b6ce:: with SMTP id m14mr315614ljo.128.1640125072220;
 Tue, 21 Dec 2021 14:17:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211221184501.574670-1-colin.i.king@gmail.com> <YcJLFQh9IA2XzXu3@bombadil.infradead.org>
In-Reply-To: <YcJLFQh9IA2XzXu3@bombadil.infradead.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 21 Dec 2021 14:17:41 -0800
Message-ID: <CAKwvOdnK2Zc72tw6CdQkz=VxoRC0voWpda8Tgo38LaiRukDfKA@mail.gmail.com>
Subject: Re: [PATCH][next] kernel/sysctl.c: remove unused variable ten_thousand
To: Luis Chamberlain <mcgrof@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Colin Ian King <colin.i.king@gmail.com>, Kees Cook <keescook@chromium.org>, 
	Iurii Zaikin <yzaikin@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Xiaoming Ni <nixiaoming@huawei.com>, linux-fsdevel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 21, 2021 at 1:46 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Tue, Dec 21, 2021 at 06:45:01PM +0000, Colin Ian King wrote:
> > The const variable ten_thousand is not used, it is redundant and can
> > be removed.
> >
> > Cleans up clang warning:
> > kernel/sysctl.c:99:18: warning: unused variable 'ten_thousand' [-Wunused-const-variable]
> > static const int ten_thousand = 10000;
> >
> > Fixes: c26da54dc8ca ("printk: move printk sysctl to printk/sysctl.c")
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
> Acked-by: Andrew Morton <akpm@linux-foundation.org>

Just double checking; I don't think I've seen someone supply someone
else's Acked by tag in a reply before. Was there some discussion off
thread that I missed? If so, do you mind linking to it?  Was this a
typo, perhaps, and you meant to supply your own Acked by tag? Are
"Luis Chamberlain" and "Andrew Morton" aliases? :^P

-- 
Thanks,
~Nick Desaulniers
