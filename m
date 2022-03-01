Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF137C
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 20:27:14 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a8so33846783ejc.8
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 12:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PdjKf/a3poLbp/gbxt+Rqw8zr6wpWCPEMBt3Gdf0vVY=;
        b=K7n4eVxkkqxw4LVOCYp6qjz4Lrn8nUG8scqpDLjNdEqFXZMud6qwqiSVAz5st7Yg7d
         vC2q3Dqvtvzi4XIPeFoMoc2+dMBhZ16QOgzUWOKknYeZr7LRcjqzvrH7Gver9/sEKKQs
         f6/zgOwraRIJv6M9/T7aFKvmQFpJdJkC/c588=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PdjKf/a3poLbp/gbxt+Rqw8zr6wpWCPEMBt3Gdf0vVY=;
        b=n3FRKM196KkR2BXMof+iKX9Gaonrz4yTrc8W9xO7jOKx3JkrN/FT0uvOQwphJ6B1Yt
         w10sdpRR+7LgHY0GrOYq+RqBdHTV70URWWN5NEmJbgQefcEkuRxr7aqcNClNVNY+/Nt2
         JqTz4rTC5MfjXdtHqQ4ASqLtZ7cKbAtMKXXgTwQ+p0HizpABvPP76aX7M4l0kHbx6e2w
         A02xO6P9QBPwKNeT0xxaPZmpLBlM82QieCImEIXnkPVRUzfH9VqzHP1U2qlGSZQbYJKq
         ZztZG2wUmVsohApJBXACXiJiV+tsHyKi9cQBM8VkFCR1Xfmz3+XoHau7Dap8s3KTbz2P
         YG3g==
X-Gm-Message-State: AOAM531aZZ6Htqdmm8maZ/cJmF00l9QZhw1wRZlFBiJebuUZnVIbNJqT
	KaXotJg4exQIXQ4zYI6hxXFcvhhi940QOp+nTv0=
X-Google-Smtp-Source: ABdhPJwLKOkUEgYfX+QUXgikHoS5SNTwL/c+n9DooLAxCTunCqZIP83ycG2EMi4xKVp/p4FSNgI6Qw==
X-Received: by 2002:a17:906:a92:b0:6ce:6f8b:a1ba with SMTP id y18-20020a1709060a9200b006ce6f8ba1bamr20507112ejf.715.1646166433067;
        Tue, 01 Mar 2022 12:27:13 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id h12-20020a1709060f4c00b006b4ec988cc3sm5641891ejj.4.2022.03.01.12.27.12
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 12:27:12 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id f8so11419291edf.10
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 12:27:12 -0800 (PST)
X-Received: by 2002:a2e:aa1f:0:b0:244:c2ea:7f20 with SMTP id
 bf31-20020a2eaa1f000000b00244c2ea7f20mr18277669ljb.164.1646166026459; Tue, 01
 Mar 2022 12:20:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <20220301145233.3689119-2-arnd@kernel.org>
 <CAKwvOdnkfuT_w_0RNCb+WTKJ+282zLKmhB9UNG=D-UFz9VkUng@mail.gmail.com> <CAKwvOdn-PrCUPe2WzLv18AH3=9DjtFES+r=M1DhoQivy8sHm-g@mail.gmail.com>
In-Reply-To: <CAKwvOdn-PrCUPe2WzLv18AH3=9DjtFES+r=M1DhoQivy8sHm-g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Mar 2022 12:20:10 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh4OdQANe7TLYGdPWUub0MEdbGDr72wpATHxypaSEGAyg@mail.gmail.com>
Message-ID: <CAHk-=wh4OdQANe7TLYGdPWUub0MEdbGDr72wpATHxypaSEGAyg@mail.gmail.com>
Subject: Re: [PATCH 2/3] treewide: use -Wdeclaration-after-statement
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Marco Elver <elver@google.com>, Jani Nikula <jani.nikula@intel.com>, 
	David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, llvm@lists.linux.dev, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 1, 2022 at 12:06 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> That said, there's a few additional places that reset KBUILD_CFLAGS.

Yeah, the boot code and vdso code often sets its own private flags,
because it's _so_ different.

The generic kernel CFLAGS often don't work at all, because that code
may be doing some truly horrendous things.

So I agree that this may not catch all the kernel code, but I don't
think it's much of a problem.

             Linus
