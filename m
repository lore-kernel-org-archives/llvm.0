Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752675;
	b=4/Al0xmTviD5FCZB+xLU87Adiarr7HpYXYmDAIBkh3e9YAHf3u/HBl7Wd7yGDAn2j71s
	 3lDH20XxeSpYL2yKjOMwL0dJbL9zGroFRYueFzbUcX/orjTR2pvPeUKDwtlP2KgA5AZP5
	 0nz/LDapnxbVfUwXyIBgUNF42mVqjDkf1I+GdJ9b606LUse5l1q5m5UFz0jtqZE8X6X91
	 6VelXsG04sxAEJtLGRNxt8cPwHfljXYS1zpM8dePv9GJyxEAwy/Wzg4ClQgLIkg46QD7K
	 UAIV9R21FM+0aPF6yP+SUMCqEJw9XrDD89idqf/bTVGdxSeSHAvZaGWrO935y2bNDVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7QzzvIBZ5m85jb8a3T2vbOcaHxM8nqWRH2JKBq6oOx8=;
	b=syYuDnYkyTld1EG4xdQ5mcr7aF/CfcSk5uJpPq5N9kDGBt1BR9LqHk9fotnkhqHXRxN/
	 jr1O8LOrJ+UxTXvbWgbuns+hPHGkAvI1BU8lpsFdRAH9OkiH924Lq+v8vy0N3sHhGVnzc
	 8HO2Wc0VLDPWt/rfBepZD3tH32ztKeq3tL+F6dWphpFSSJiXAATL08UOnODijaaYM/xj4
	 RVT6VHBrdqzmylLp24deuBPoBa3WiUoVyzz0ABbIc/vkcJFhsFyGkB712XjZPQ9TIOZEV
	 sRZcCfPuPUikngg6z780Z4dSfkzHnHaNHv+aL2Qj1VB0JTjO4oN8upNIb8GejOSp/lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpdtUu+g;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC0A606A331
	for <llvm@lists.linux.dev>; Sun, 15 Nov 2026 14:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC0A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpdtUu+g
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so19855515e9.0
        for <llvm@lists.linux.dev>; Sun, 15 Nov 2026 06:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794752674; x=1795357474; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7QzzvIBZ5m85jb8a3T2vbOcaHxM8nqWRH2JKBq6oOx8=;
        b=PpdtUu+gXeXeea9VRjO8xyx+8VzYUvRNNQgRVf/Ol4y8a/1a2FwP48XiwJD4G0niX4
         n8hHjmpp3xwGaUtB6NuwKGpvSsfZdR97aNhdPj97AoNOd4B5RtVGHsg7mbp/IHlQlbka
         KNjhEyT/Yq7Wkuxht69TlsRRLwmsF2q5TF0j3I/i/yy4LTxYnpPPc4K5fVJv2mNAwhH4
         2PXpKGGxXtQCQ/+VT+fYWAIgdayRCS5tvUC2/XX/rggCKAyZEl9hd21j0xSOYSI75+cU
         boXT0fNn7O6utoDHvQVucKVuLydG4DfGSE6+pzC2yqSLnzDIgjFico3ez0dcODttfcSb
         szzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752674; x=1795357474;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QzzvIBZ5m85jb8a3T2vbOcaHxM8nqWRH2JKBq6oOx8=;
        b=lOWKUddV1ldJ0t2sjkTdCCtQVFMz5V4znlBDIUCIhDiDzXP/VP4Y3B0ewh6xAwPhBX
         9CLZqj5AxYHyBJH5nsN7ffXI0KvEqq+oLeyO2MJvDGfQkc+YiEvA2QqGMMW2ebDC7RtS
         Vlm59Y/QDz1pFyxdY09T/K5JiMlAxVqthEe2NkKKnKQLFCbAIeyFcGKSDc1XU8w0BE0i
         ZcWS0zpQgQ6kw4bgyazjeG/pqOs2M1qMRk2UZJhbp3a6JvU4H8M8bfkUp0IEZ25PnlrE
         xrdxvon+HhFPLHCBppK3EutUnGvrl8hCXJRxDEqtJCXRXf5pRrb2ZTi8k1TAYRQBGF8a
         ggkg==
X-Forwarded-Encrypted: i=1; AL+hErEmT3ULIHo5mhLw7KR3yUW/cuFxJ8le15M4xXXtbT6RJl07cK6MeHu3bjDvwh1VsQUmADgB@lists.linux.dev
X-Gm-Message-State: APuU4Z+GXBnvVvxQn1bWR2YeXytPrEIey/yCY0HPKB+utfOOqXcxt4UJ
	tq4n4POpJma/mwi4bN89ncv+6G/xs52UraO9OGyrDKywMoj2I05RjVSq
X-Gm-Gg: AYBFou3TqTStslE93edJCiypDUMVkw21ozrfPgsEdEL9lZOWlW+pgNqXPXfLihArm+x
	qiRIPK47oYL2H2DCOeApyj5+3+wQDvWuuxRSCVWCyFJtiQKMrfEaWUu3rCal/jTR6r9bRp/8L7q
	ViU5UVbFsyPz+Ni+ed67qlH3Ouac2ZwbR2Iqv4m8RoKuZF2Q4GDTeyfD6XF840odEUO2Ey4B5j/
	cx2pvd9qFOBvXxkopxOU8MA6zKZKPdF1o47g0a5nCERAV58qmNxdAYMpc6QJIgWXDqQLKdHwBSE
	POd0guJMuV4bUCg6Eol0yPBOXYjaP65BALBWHe7j+E9URD1t397NDt0Dd4z0JTchnFXIxCoejMd
	hj/vZHisWKXtOYb1/Iab7LE9IyCJmyOdMKspNOv4w4rXdWd8WIY3Hy0itES/8I6VQe0GII5vFzF
	F/GU/Xs+ecRiWo9AEi7k0yPdVjOlO8fZoi7wdXVzgSZceOF9E+P80FvtNTiQ4R7EkIdQAHtfoUi
	Grs6O3uA/Oq/0NfBXaP8XW+FPK3Lr/le6SgROvaGHGll6esDlCTD86iSflzUAO4aFYYlpeyViWr
	ep3mKOzC1lYqlGk8078962hHyDjgTs33y3h64WWn080q2S8utVwz9lXFrrTzW29GaJO8HEEsG7k
	EQkIP5CXB+bw=
X-Received: by 2002:a05:600c:c0c5:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4bb55a6602amr130912825e9.9.1794752673813;
        Sun, 15 Nov 2026 06:24:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm318854915e9.15.2026.11.15.06.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:24:33 -0800 (PST)
Date: Sun, 15 Nov 2026 14:24:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Daniel
 Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Aaron
 Tomlin <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-modules@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v3 0/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 and KALLSYMS_QUERY_BY_ADDR ioctls
Message-ID: <20261115142431.1587690a@pumpkin>
In-Reply-To: <20261113221248.3535369-11-wusamuel@google.com>
References: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Nov 2026 14:12:45 -0800
Samuel Wu <wusamuel@google.com> wrote:

> /proc/kallsyms is the primary interface for userspace to query the kernel
> symbol table. However, resolving even a handful of symbols or addresses
> requires reading and parsing the entire text file, which is often several
> megabytes and takes thousands of read() syscalls.

Separate from this, I've wondered about separating out the /proc/kallsyms
code from the code that actually handles the symbol table itself.
The two parts are pretty much separate.
IIRC it uses a static function to get the symbol type (which does most
of the work of getting the name - which it also wants) so it isn't
completely trivial.

I'm pretty sure all (well almost all) the changes will be lower down
the file than my changes and won't cause (hard) conflicts.

I've been compiling kernel/kallsyms.c and kernel_kallsyms_selftests.c
in userspace for testing both, but had to cut the bottom off kallsyms.c
to get it to compile with a sane number of definitions.

David
