Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ACE45F64
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 18:32:03 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-577fff1cae6so2147743a12.1
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 11:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695407523; x=1696012323; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ngBf+ICvbxi0AiCYVulY76r9llgqXQtbJzL3HizOtVw=;
        b=IPh+o2nxh9qZNp27gzsf/B4QwML3+yf+L180WZdZzLyzt7PoT/Y+9xSuaO9y0NNho2
         EcWl0SZdp1xF1kUCf5FpDOuboEZesrt8F8zcCK74b0uJeTK/dhkIJWAm1vc3VhaHDjq9
         54LonZ0G4uNsKF1PTn6H9r+XblSl46K8EGoq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695407523; x=1696012323;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngBf+ICvbxi0AiCYVulY76r9llgqXQtbJzL3HizOtVw=;
        b=sYFH5xPuuHEMjLuTRpJhEmYgNca7KfLwKFxwujxH0ByPuOeTsZOySShxFvAfC+2Tij
         g0j2mrsjz47JVoXuZuI6sim3GgwZkL5KCqEwStuvb3czaZDPzeXh8o39vL/3o8iWQPlI
         5kGXysCzuKZxqt240r1H5qpqdSIVjmBYW5BpWbgTY5z3aelLat38FzjVc/RKJAhtkYWQ
         4JFT1NdfHePxWEAW+rrd9VZD79LDAibm9FJ2e2fBiEoK1BQxCot6vnsCxG4qVGdHzRVq
         U/hsgWauo0INyJkViifmMoRYQYp5RvlCWJbXknf/szvItpSZb388N9IK2VKU2moEIg6l
         Ji5w==
X-Gm-Message-State: AOJu0YxLCkGg7GV1/6QspzsNmkW6zA5QSPmBwjXX/CyXnKXsb22FO6iA
	fzs8odrpXOvJXtElMg+7bV9o0g==
X-Google-Smtp-Source: AGHT+IGMpVeVaBKxQRuTd7FExBg+6JvbIKew4fzduHUrzQv2ncVyYW9f1qAq9F1UrlDz3W3OfJNzAg==
X-Received: by 2002:a17:90a:428b:b0:268:535f:7c15 with SMTP id p11-20020a17090a428b00b00268535f7c15mr5122344pjg.0.1695407523130;
        Fri, 22 Sep 2023 11:32:03 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 14-20020a17090a004e00b0025dc5749b4csm5726599pjb.21.2023.09.22.11.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 11:32:02 -0700 (PDT)
Date: Fri, 22 Sep 2023 11:32:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Shakeel Butt <shakeelb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Yosry Ahmed <yosryahmed@google.com>,
	Yu Zhao <yuzhao@google.com>, Miaohe Lin <linmiaohe@huawei.com>,
	Yafang Shao <laoar.shao@gmail.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mm/memcg: Annotate struct mem_cgroup_threshold_ary with
 __counted_by
Message-ID: <202309221128.6AC35E3@keescook>
References: <20230922175327.work.985-kees@kernel.org>
 <CALvZod5xVhR_Feq7Wp_P9BLjYHJCxqvA6BmHmzwGzw34niDQ2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALvZod5xVhR_Feq7Wp_P9BLjYHJCxqvA6BmHmzwGzw34niDQ2g@mail.gmail.com>

On Fri, Sep 22, 2023 at 11:25:56AM -0700, Shakeel Butt wrote:
> On Fri, Sep 22, 2023 at 10:53 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > Prepare for the coming implementation by GCC and Clang of the __counted_by
> > attribute. Flexible array members annotated with __counted_by can have
> > their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> > (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> > functions).
> >
> > As found with Coccinelle[1], add __counted_by for struct mem_cgroup_threshold_ary.
> >
> > [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> >
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Shakeel Butt <shakeelb@google.com>
> > Cc: Roman Gushchin <roman.gushchin@linux.dev>
> > Cc: Johannes Weiner <hannes@cmpxchg.org>
> > Cc: Michal Hocko <mhocko@suse.com>
> > Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  include/linux/memcontrol.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index 45d0c10e86cc..e0cfab58ab71 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -143,7 +143,7 @@ struct mem_cgroup_threshold_ary {
> >         /* Size of entries[] */
> >         unsigned int size;
> >         /* Array of thresholds */
> > -       struct mem_cgroup_threshold entries[];
> > +       struct mem_cgroup_threshold entries[] __counted_by(size);
> 
> Does 'size' here have to be a member of the same struct as entries? We
> have nodeinfo[] in struct mem_cgroup whose size is nr_node_ids which
> is global. Will __counted_by() work for that?

Not presently, no. This may come in future expansions of the feature.
We're also hoping to gain expressions for places where a size isn't a
native count, like for big endian, or a byte count that includes the
entire struct, etc. For now, though, the feature is narrowly scoped just
to get the common case landed.

-Kees

-- 
Kees Cook
