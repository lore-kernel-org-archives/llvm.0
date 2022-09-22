Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817647C
	for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 17:41:19 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id h14so1481182ila.12
        for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 10:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=AsxpWsr5dzcIncNfx/+Sw1HyEwfMiBKVAKBEW7wNeQA=;
        b=HG1BCa9aD7EruuXSP8vfBpl2xSAcB9NgvDE4n3t4WegezK8iPhrhfTbs3Xxfdxp/aP
         0j4XfOQ90rYJJLxvR5Fxutq+CKSR+3NwG5g3gHNWC0rGeSJkCPwM1qeiyt5MoX9kie1E
         Ogc+09wvN660uSYqTrtW/DY7BHEKikOuBqjuMNkdFuICid58Qmi9sfyROy/V1LgkIpE7
         e2Nv1gEo4Vp0GQpWl3bRqM1059jceqcIcZbW6os/ZnPJ8J1PnWKNgSi8e2+WYP/WJpYk
         +8abyMsCFGIX1fgDuD8Pv5kCGUDjVFxUFNtnD5auEWqa0LNmLWv9bnrrUipYT443cCtB
         +LNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=AsxpWsr5dzcIncNfx/+Sw1HyEwfMiBKVAKBEW7wNeQA=;
        b=TlgS69TgPkMajflY7P4PCr12a7vJJfBDjObqnvA6vW43vBIo53a3fSHF3rkucP/1bN
         3FVnySiq4BRO1VRZ6jLyeR5yYIaAiE13XD1rKMnlqzceZHzDVEHXwxs4bIrQZ/Nbc6ac
         MqR8yeFC2pIexUXu9NnoQtXzmHiQPoANmZscxmjhgONTC7sT2/3Xw7cSBA1yLcCV2TCI
         w6quowiV5o+u9Bx8lyJT23cUog8+utYFPf+Vq42lpPvrQ1HD7cn52krajcfFjFPt1++R
         Kkb5XOZSWXT7LkCMrbejpkfu5X3oex0e9oK8bF6lhKu6+/aHnMPOjNjzy3rjYZHQd/Ls
         bi5w==
X-Gm-Message-State: ACrzQf0vsjh1eIXifJxYhyMcwXD/TwCZ3vzniBkFpmoOqSjZm5wGiOvp
	yZDmYLUTVue1P8OsSW03Hgj815NS5aY+bDGkldc=
X-Google-Smtp-Source: AMsMyM5Iawxjt3SoOGTNllk8NVk3tyvcsl1U/lS7sz1j/GB7JoPgBuMEGvT0T6zJ1tbupUccXP7nLvzrv1dgRwQijjQ=
X-Received: by 2002:a05:6e02:152a:b0:2f6:58ae:ff0c with SMTP id
 i10-20020a056e02152a00b002f658aeff0cmr2429401ilu.237.1663868478589; Thu, 22
 Sep 2022 10:41:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220922031013.2150682-1-keescook@chromium.org>
 <20220922031013.2150682-12-keescook@chromium.org> <CANiq72=m9VngFH9jE3s0RV7MpjX0a=ekJN4pZwcDksBkSRR_1w@mail.gmail.com>
 <202209220855.B8DA16E@keescook>
In-Reply-To: <202209220855.B8DA16E@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Sep 2022 19:41:07 +0200
Message-ID: <CANiq72=unhDJOGTg+ja4UdVRp8sG7Wc+_rqQhvJideA=WNjbFA@mail.gmail.com>
Subject: Re: [PATCH 11/12] slab: Remove __malloc attribute from realloc functions
To: Kees Cook <keescook@chromium.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Pekka Enberg <penberg@kernel.org>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Hao Luo <haoluo@google.com>, Marco Elver <elver@google.com>, linux-mm@kvack.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Elder <elder@kernel.org>, 
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jesse Brandeburg <jesse.brandeburg@intel.com>, Daniel Micay <danielmicay@gmail.com>, 
	Yonghong Song <yhs@fb.com>, Miguel Ojeda <ojeda@kernel.org>, Feng Tang <feng.tang@intel.com>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-fsdevel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	dev@openvswitch.org, x86@kernel.org, linux-wireless@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 22, 2022 at 5:56 PM Kees Cook <keescook@chromium.org> wrote:
>
> I wasn't sure if this "composite macro" was sane there, especially since
> it would be using __malloc before it was defined, etc. Would you prefer
> I move it?

Hmm... On one hand, they end up being attributes, so it could make
sense to have them there (after all, the big advantage of that header
is that there is no `#ifdef` nest like in others, and that it is only
for attributes).

On the other hand, you are right that the file so far is intended to
be as simple as possible (`__always_inline` having an extra `inline`
and `fallthrough` would be closest outliers), so if we do it, I would
prefer to do so in an independent series that carries its own rationale.

So I would leave the patch as it is here.

Cheers,
Miguel
