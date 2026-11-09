Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794196078;
	b=I51e8eq+xoZ1coz1FkHRdHJLotURr9lFMekOO8LqBDsUH5hVnnBXDhWFvnhV+60FDLdZ
	 dHLsjJyZB2+ikX2XqJF4kHVCbD4EEN2VeDpg3a9UlKUD/wbFnkWqa7X+GollhmgSYI+y+
	 YvVqCpCKsN0Ppeyw1c1yFvLeQ3Xx8sQV52F1kySdJN/eQAMq29So8qVFOqKKvJkl7U9mn
	 Ay/B00RovfJybBM12vNeRVoqmaRFq8UhMpNiLxezfTzIHkiiGL2HpYBKtnspi7oa8A1E9
	 0ifzquJy+Ss+56LLy76gADJpzEPNTAA+w+hFyni2Fomzo6m1fxUZJ0m7t+yAgGl8ViQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=02Xm4AXZtFCOeYUfXGvoHJuZWiU3qVVXajNv+02pe2I=;
	b=J/QFTgb0oMu6jLh2kbp1zF49sQYULLrovsCRMv1hCOLTnsrtK88cnb2ubWV/9ho3vcor
	 +CMWuoHqmilQnctms+IYEwHD+Lz254YN1xE3MQS55nbPTfiOYmIkXGXTdp7rEXfEMEV4P
	 5R4kCnPASncAr7TpVwH4xZf6RqXtplPx/UN7GnxBq7sqdpJLewP23i1qRTRFu9bXgcPh6
	 BNvZWQs4zip29AUxZweUMzpkKewlJJrbac75qUbs34dCvBbHRBv0D5YUozjpAu/kA8zXH
	 xbV05eRusj9fOqc9EpbKNaJKc/s8TjmAl48dYdZOWi/x2y9pPdDbkRsC8HMZbDDZjbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="IPhIMJ/1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34723606A323
	for <llvm@lists.linux.dev>; Mon,  9 Nov 2026 03:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34723606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=IPhIMJ/1
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-84e513874f8so288407a34.2
        for <llvm@lists.linux.dev>; Sun, 08 Nov 2026 19:47:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794196076; cv=none;
        d=google.com; s=arc-20260327;
        b=ifZoPeoKBVg7fvWSnKk1K1aeCazXUdpqz/1U9Jn7cQDALsbiW4VQUb5Gd3CnBtNf79
         o110WXfuT9DnNHzGMFywoigcmBDYqbGfg7EFRlNJuNa/wc5T5PqGUyw744spf5O/gUPM
         N7PY61zvKIrQVd/ZWYlCm3OVuf4QqKYbUKlu49X7onKuFxvYTZ1JiLkxdXbE0VZmq3eZ
         0xE8GkMSQ27uunbUVAkRc7RbgahjHXX1reBzc6mX8xbqw3LmfphduEBoNnDEqQ2Pqlsx
         jpPDxTIc4ba0shmx50oFRy6wYHBDv5D3aKYhcWBV0F9dwyHq+q/ITHe2vDR6HRlOyO7E
         QdVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=02Xm4AXZtFCOeYUfXGvoHJuZWiU3qVVXajNv+02pe2I=;
        fh=bl8QBDZDrVT/69T5o62hYFHzQdp9eJsb5rC+9Z2bde8=;
        b=i1+ziDn4XQMYtpAPPmMf8WysFtPRttffD7n7pl85+sjwyYu97dfQuYp1JMcJYB6s9P
         nyFDNI2xJXx14AhZc4+GUU79Vlfu+MYarPfcgSBWxSjYkHgM7m0VOjGR9yUfc26ywdMN
         EwJQ5LHmi64BnOuZ1B1Y5LSMc2DKD8RlT+mPEf30i2zPTI9nJsvMVEW0NsY5QM+92toE
         O9OSwNc0tQdaggghJVWsfqVbhabjST8HSqdaaMtZzf9WCBm3mHoK4qh1qvlkitdHZsGT
         OYKMyo0DkSU87yXMFHe+nxd155bQd+Qyz/0FQjWFzrR2Yq/4JcvM0YyDrStFB1LTFiWR
         MNNg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794196076; x=1794800876; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=02Xm4AXZtFCOeYUfXGvoHJuZWiU3qVVXajNv+02pe2I=;
        b=IPhIMJ/1hhgmVb4CwSS4G3a3HegSZsD8xgfcX22kpU0WfBDFsZFOWLy9vZDbqBucUA
         tr44/zanUMPdfJRJEmAVLkV0JkYRQyKU7sQlg8+cEIscUA37lcn/9Khm+HNf2kz8WSyz
         4icCYs3aEMY5NrOz+GeZQK6/KvjkFRwwWDJsgvjo2TG1UIm8kZ2eK2cdsFQOv+ff4hFs
         CTKYFDgnM2tYgF7DRSPrRMRVk2Qd87Gf9HgjU0w3wlXGyv44pp718guJwQ1oqLdZGbgr
         PinJA2XJfhqKCjzv1HCBGRT1SjESkz2ayJbDAVZl1oBhYjuGs7rzyigx5T5MGzZfutjS
         5QBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196076; x=1794800876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02Xm4AXZtFCOeYUfXGvoHJuZWiU3qVVXajNv+02pe2I=;
        b=2etsvKSIqbj/PvwHJ1iiRpIpKm2fbGMLS7VeCV6FjwcbryA+n6NS9XNrVfBzqrQVWw
         gR4q0+jgzzsZicEcz9uF3d6p5MC+LYE8cg6B1pX4m+ZCk71Ga1QfQKNK45vMtSODA02S
         qvLmDxbqufbuZeFhJDYI8xiNlSZZatTHQWuT508pWwhmmk8PHOzhzkN0F6QidUEQxBv+
         tHhFSQfmYR12EA/giYSChS9WdRaUYhEjmaYyxYJT2SGp3JS3EulJR+95YrBbdk4CvnJr
         HeG+fu8Xh9go8CvZZwO1ZPsKCu2rjqFeyH7eCG2+VQgsbR84UB3KcP0oHz7b1MQuoJAx
         lx8A==
X-Forwarded-Encrypted: i=1; AL+hErFA3AgC+fd+gP4g9nLsmslbwfQHdgvGH7GQXUtSJHKNesvxXEWCi7y30+kmxykkOK4uBP2O@lists.linux.dev
X-Gm-Message-State: APuU4Z/bRv8gjtaxXXbEvSS3cicRroMm08wnDnpoofEB7JYAQaVIN9Po
	0zigmzfZOwvvVSkBzMVt7xSX9kISlStlXLccQyrgIBF3uBi5MFfqSsenfySft5id3xVgnF/6jvP
	C/GDNfnbIm8Y7X1rKAX+OYBruAgS11lT9Ru31eN1bNQ==
X-Gm-Gg: AYBFou3K2eRjUj7C9TQTnKKoD8ewFc2br7Mf/k8ceQ3RVKn/s05E/VIfWpHPsr0vCWD
	pgVvpfSXBinY4vctrHN7DwOc87UrQuJ16d+MJ3EXCQyguf7BefI8XWsEEhDrmHxkof6+haS7CXT
	yoHWc1BW51Cnw0sq6GC/1tav5Mc2b3cgrEYRJ7qxhyK2/lERTn9zVRDqKm+rMl0Y8LliaANVjus
	B0cIho0vk3nnrMO/LczZcm7Pn+psnK6kIzhtl49l1g+kU7UEbay0aSm2qtxy40KeOR76YrMxEL8
	/mRMx0kt/HFTGGMk9UJxuzs5s9KHGLGEEqprGa9SpUVXbocXBGwjLSrPHCpbfJtl4gwkMNIiz1x
	c9qs4yQf037ggoG6S1cVASL7xNOijV84XbxPE5Ek/bRc=
X-Received: by 2002:a05:6830:3115:b0:81e:abb6:7498 with SMTP id
 46e09a7af769-85f5082de7dmr2762199a34.23.1794196075840; Sun, 08 Nov 2026
 19:47:55 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108110406.97495-1-cuiyunhui@bytedance.com>
 <20261108110406.97495-2-cuiyunhui@bytedance.com> <20261108213254.67805ef0@pumpkin>
In-Reply-To: <20261108213254.67805ef0@pumpkin>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 9 Nov 2026 11:47:43 +0800
X-Gm-Features: AclHuK9B61ylAVcWnUjeFJuyJwDuHE_2RuMPKX9QRnbJ_mu0Y53s1C9cYNJl2lY
Message-ID: <CAEEQ3w=5QwwvMJFJkpS51APoBjhed6oriCkvcieRdUFWrKtmSg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v9 1/3] riscv: implement this_cpu operations
To: David Laight <david.laight.linux@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org, 
	thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk, 
	rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com, 
	conor.dooley@microchip.com, tglx@kernel.org, debug@rivosinc.com, 
	seanwascoding@gmail.com, andybnac@gmail.com, menglong8.dong@gmail.com, 
	cyrilbur@tenstorrent.com, wangruikang@iscas.ac.cn, atishp@rivosinc.com, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org, 
	arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, dave@stgolabs.net, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Nov 9, 2026 at 5:33=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Sun,  8 Nov 2026 19:04:04 +0800
> Yunhui Cui <cuiyunhui@bytedance.com> wrote:
>
> > RISC-V has no asm/percpu.h, so this_cpu_*() read-modify-write
> > operations use generic implementations that disable local interrupts.
> >
> > Implement RISC-V-specific this_cpu operations with preemption disabled
> > to keep accesses on the current CPU.
>
> Have you looked at some of the schemes (I think arm64 has the latest,
> but also s390) that do most per-cpu ops without disabling preemption.
> In particular they save the pre-emption check when pre-emption
> is enabled.
>
> Basically the code tells the scheduler which register contains the
> per-cpu data so that it can be 'magically' flipped during a context
> switch.

Many thanks for pointing this out and suggesting this optimization. This
is a very useful suggestion. In the common case no preemption or migration
occurs, so the preemption bookkeeping and reschedule check are unnecessary
overhead.

Implementing this scheme for RISC-V will require additional changes beyond
the current series. If this series is otherwise acceptable, I would like
to land the current this_cpu_* support first and then prepare a follow-up
series using this approach.

Thanks,
Yunhui

>
> David
