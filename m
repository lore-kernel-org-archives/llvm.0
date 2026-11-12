Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485377;
	b=FtVkeNh4DGOhnfefs6Gjqv1KgEILeL0AFqhutyrlypI8zSa9bdpnip159eWPLwv1O2n0
	 Do92NNqfSVnrtI3Z5bXgKh86x0DDf5t5yRfr4BtNIyGDBCpuDePI4OTz97gePLZhY5FYV
	 4ZsC7P8F+likDzo92151g0fsKRWiKers7w3sAMarmZ4gx2ywlh3hefh1aUXwlf6jbXK2J
	 Gu1FOkc8bk8pCyeonR+Bcu9lKovs4Cj7sijJ8yKIhpmg/4eEJXgcTm+ZDkMya9nij5yhN
	 1WpnZj8OaXR7rqDItjTzIK7vIMleLDAf4zxw+OvenrpSmVHYaxGY+/JLSdhGhX5uLqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=yVXFtg5uv6jmT0ohsABv7mNA4IYkbP/bTmshktkMt3c=;
	b=2wlwn4HzhnI3i5KTYpI7QakEwdV0HrAW0Y3jgCQ95jLrCKxyMPXJqblIEuAgwkuUNf8J
	 wF4A6HrC2jHThfUM2u9T+9xWYX6+vsRdexl6BFetzojqEfVFE+HJOsj8zRsoAgjmcxPV/
	 RZDskZ9zyebOxD8wEUDlKG334NgzyXNVAwjcp31avnXZ7i08VA2oQ1ei2t/HQW7dvFoeE
	 ARRF3DWdDOWg1rvHYbvddqBS1XVBXAInc699QFXgmHlIwNyJIeU3fcoP90E8g7PguSTR9
	 AnWCsLRI6z/4Zuw9vZHExSyz2/HyzkCS0r0ICnwAY1EvqHHcLb2xz6klYwV7wov/ykw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwWzu1u+;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04795606A32E
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 12:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04795606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WwWzu1u+
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4922dbcee23so2454886f8f.0
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 04:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794485375; x=1795090175; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yVXFtg5uv6jmT0ohsABv7mNA4IYkbP/bTmshktkMt3c=;
        b=WwWzu1u+Y54i3NU9G6Z99kAcOr9oQOkyRygAlXklZzTG3XFTtJzn1BYJDGVxQ6d4Wg
         TcsPcRP1VrOw5CB0NyR47ns1PLFJccuc2AiL3dSqx+QWekclnCpSIJJlh8gbT/EBCUMz
         bt7gCgbtosWW9leWlBME8Cqt3pfSPa0o3jGQmF/y5oRglAPL7YTdtAjEHxIaJdgfUqyB
         OwFzSq7RsIMTPpB97YZuVYzBibmjE5ZPH0K+gIUDOSwbPLtW3pBMaGx3t2xBE4Bg0CG6
         yw5qPEAOJJ+BJqYuEePQBLrlWxRmuXlpCPgE7PFSIrn9/ChV5oLX8q3Z0LO0uqH6xK1B
         4bJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485375; x=1795090175;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVXFtg5uv6jmT0ohsABv7mNA4IYkbP/bTmshktkMt3c=;
        b=nKGAAI/nTkVt4QAR4R/Cqi2G+7vbcd1WVW/JZBd8xFRKSytorxxI317hr/FZlh+mVI
         zWgqnvth4Fpp7vvWa3eiir3r2Q4pjX25nrYZj8oPoPuyVWdY8xkqBedmnYU8OTY3Ql/7
         VhdOSKBgizetQjeeXC7OCnGacFpBt8VgfPAfr6Zvs28ji+1kCkPVbSNFRMAbI3kGGkq7
         b+sSvGJ6lAz/3w0i32DnydkPY5xnxunJCyDrE0PiU1KLhROdBMYNXxBrhAqIMdnR60m7
         aI/mo4IbCOoRkJdySUGs+ngRUpQNo5/6l4YAfthyDEPUwVJ432mY7DbT99SiSJZO01f7
         UGAQ==
X-Forwarded-Encrypted: i=1; AL+hErG2nJdO3JCrc8LEE7/NrJW0hQXwbY96BYamrfFjQFIlgK0DEOT6BGY4Ie3+rfVQH55B6RA4@lists.linux.dev
X-Gm-Message-State: APuU4Z+I9Z+Dlx1hrVHV3tCVoneMmoG3qeNdxkcFXMJA1pJJDB8ZgmJw
	7k+oTxZmlFfyrxl3V3OB3Wqw5V1k9qOSRmqfSXEusRu/DDd5y5Mcvd+Q
X-Gm-Gg: AYBFou21VNXnpE2DwXLGyKsj2nL90LJeG+KkxvjQcoSdosUs1tv8dhcl2lQrh6LMKfd
	TfKPi4mbPxBQFV8QiaI5QayRff4mQEge0PCRODojmx1esIqlvWSfTwP1ftp2M/wafOOoUhQhCV+
	wrHwHpBbTk9vjRbIz0nzbBjgT1g3we6T7Q/vRMDUyfWdkJJ1sWFn7ARR38WA1FaKI0k9B9Ngu2I
	VvlM691pwBy/CbLxOd1Amr840aAKe81ypk9p/SgC5egixHbUnkcVdg84CyUe3wdUBU3ICeCGIKG
	YeFC6hoIVz0+46a+quKNwA/0ZbG5UnEoxu+E+XL/1b6iKpxsrTafKTt5jeeoFo2Z+MDw/Oihgae
	zUKZQab1f9thyWaZh5tFiaK7uNNxt2LtYtWH5j1PCpHeWhSAFtU+bJthFyzdQIVJ101Nr9Fstqm
	UkJNUXKo+YTekZsdVQCY+6XEicQJcaR7vu8hl2CsKkt9K1Rp/5eiqHMy8Godm5shraAbLgXFjJM
	xPGNqiob/MgyPHnuKB//w9+aiVXm5bpSrUgFmNaRRpEDalFK2CTfeQxjMSLkFRZjyffhLnbldYv
	GKWJYjhZ16wgurfyJI0XPALks6V4nhkSVMvNOhAgGO8zRXFTlqqkbRZL2GX3cKOnAw==
X-Received: by 2002:a05:6000:288b:b0:48e:2a04:4ea3 with SMTP id ffacd0b85a97d-499c3aaa3ecmr10258629f8f.8.1794485375130;
        Thu, 12 Nov 2026 04:09:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49895f4e6ffsm15149402f8f.16.2026.11.12.04.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:09:34 -0800 (PST)
Date: Thu, 12 Nov 2026 12:09:28 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, dennis@kernel.org, tj@kernel.org, cl@gentwo.org,
 oleg@redhat.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 ihor.solodrai@linux.dev, bjorn@kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, broonie@kernel.org, dave@stgolabs.net,
 jszhang@kernel.org, tglx@kernel.org, conor.dooley@microchip.com,
 thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk,
 rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com,
 debug@rivosinc.com, seanwascoding@gmail.com, andybnac@gmail.com,
 menglong8.dong@gmail.com, cyrilbur@tenstorrent.com,
 wangruikang@iscas.ac.cn, atishp@rivosinc.com, apatel@ventanamicro.com,
 arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, bpf@vger.kernel.org, linux-arch@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v10 5/9] riscv: implement preemptible this_cpu
 add_return operations
Message-ID: <20261112120928.24145d44@pumpkin>
In-Reply-To: <20261112104149.38589-6-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
	<20261112104149.38589-6-cuiyunhui@bytedance.com>
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

On Thu, 12 Nov 2026 18:41:45 +0800
Yunhui Cui <cuiyunhui@bytedance.com> wrote:

> Apply the recoverable per-CPU address handling to add-return operations.
> 
> Native-width AMOs return the old value, so derive the new value required
> by the percpu API from the operand. Use Zabha for subword operations when
> available, or a masked LR/SC sequence that returns the updated field.

I can't help feeling that some of this code is the same as that for
normal atomic accesses.
Can they me merged?

David
