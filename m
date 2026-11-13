Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794557484;
	b=MF1fzHTbbGjm/jyJF0vYOVoLM812nzJOySosl4U25HI7IQk9VANMCjoPmLkZVpBflbJ4
	 BOwQOSRRCEO+VUlmr8Yc+sWBGomEDhj3qNNK6n64Bbj8a7IZS+TbebaQCYbIDB4HBv9Xg
	 rR+BP88F31mP9RDVtRmiSSoR/ML185aC6FPaIgI+ZE3g3BrJRGIlCVZRh/oAt1IWBzg1s
	 1qBOWTKnxiVn/OfH+gEjjNOuq66kP1gB1JLvwfYOlrsYUWZSnjXE07U4RcQj4slTNKoAw
	 WM2OXK8eIL3FChhmf8MQh8Jz4fTd8+KBmJPBSCSzLL/kcODCftWBwD/dHvbFk9vP0RA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ky1fNcYST3cXVSIleurQJpPQOjWYx5UwkSzn2L6E/3w=;
	b=T6EZF9izz2IkBOjm/MU3nxw2KbPCwepMTrS0aBkpwBeRwSSelbVgEVSwOfztLXlujTr3
	 QsNdCpd1MH0HRcpdJKLXlDWyUFuwcb9T+c0jKVz22qb2/2b4Hv9JVSaADYHhHLhKvJA1S
	 +ZR1L+z/M+iF19CtWf5LQ8z3rKmW+9C+IYUJ2Ys+adk1i+JyNJhGUX6v5/qOlaIEWQtOU
	 24QQM2hpWD0AcJdCXZg+1gmiC4S/izXq1uGzc8UvpvvlfB8btz1vcQhgFNq3HLwccGBUe
	 hQaPShQO7d1dURB6eI2ULRX2TKBerVajQMJwbyNUlsmTUKtXdzpcsPf2hHtzzrq0RoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloud.ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=J2FIxeiQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9EB606A330
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A9EB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=J2FIxeiQ
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50737c64c8so11002166b.1
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 00:11:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794557482; cv=none;
        d=google.com; s=arc-20260327;
        b=n1V4qtLex6AwnMTxwP9JiX32EOD3TuA00MEdijkfA3rWkoSO5/UEo+TU2sZ+DUNyw9
         btikUVWfJ5ZLjqxPNc0cvGcrcW5p5vddae4cUtCkd6XTqrkFvIjFGYEVdIef68I4eAq4
         fzQO+gVi9/oQtGyl1MdfXT+OXx/oiOm1qLPPz6hJbB4eQUUzKGbu+MDId2P4dclVtovj
         38URY56aTiKS5UlsFBOfYZve4ScvSownLsTuvLhql5MJWIyNXaZSE3C11KBX3MnlcJmm
         Uz+sKvq1AUeBU7gmHoGYYnU+Tqj0x1lBM2djAgAP3llex3Ya8BZMxCh3xxS8chq8Ggmw
         09Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ky1fNcYST3cXVSIleurQJpPQOjWYx5UwkSzn2L6E/3w=;
        fh=w9VhlM4cz2W/Sfn+8ZrH2oXJOW/C8A8v+N/GtxoA+vY=;
        b=VhU0pYwBux7d346P/Z6Xn7gzKIa5bnvBfUGVuh3HfgRXl8yCRJEk7jigYL0g+UE8+n
         sV8ULrXt51bBh5EFVrg6uCvRt8BeCw7Hxem/YRiRSSNb8XUCbe7i15Ze4+Q9QKiy7TTE
         mgedDN8AZNXNjTHJ+L0/KNKTiTsZCpfbTPbuDjJFqcPTxyMfAF7QUoz6JDsL8IXa8NKU
         5j/nAIlJillgdlNQcu/EObYiB8JDnNjb96DWaiPufNSFqYkpoK8AwsemQOUkjiY+gz8U
         1WIPY5UeWb4x3+MXRvbAk7MMizPs8dn7vaN27Rcrs3KQ3/UuimM8cZ0zHNJJVrWdcVZY
         YKXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1794557482; x=1795162282; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ky1fNcYST3cXVSIleurQJpPQOjWYx5UwkSzn2L6E/3w=;
        b=J2FIxeiQOVoY1mUnkbQsJzd5VX+sWHHTlUL/HtH+fwxDOW+MXpZCP3aNjrJdq2zQGM
         E999O08vhoaWHk/e0uEwXJc8MscNWi3zca19F7L8FwgtPRHX3CX/3FZXLepQM/sVU39u
         a1eI3mK4gVEwscEJloxh83YeCgSRwPNeqUTgkkMV+2g16dg7Gg0s4YBdq55O9wdrlLKj
         Y2xOIavYfHLIh+jYhBKx4b0XaRVBhHFNCLue+uXJV8eoGTZoIkV9qoa7B9KKIW+RNgtA
         ZBTs1u7eiEC1SZ0RAr6AVGAJGne7A+7rgW1Uvy9GbAghdlWBxyGhlTUn8IrMMJTL+JIe
         nvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557482; x=1795162282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ky1fNcYST3cXVSIleurQJpPQOjWYx5UwkSzn2L6E/3w=;
        b=Or4GuGGRWjrOfS/YXmqrztdoqVKZr0hVoazKCuhqdPbZENcQbiiRZfTTbD+xdL5jtT
         oiVQi0DdVUIy+5sYZmpuMcXzgqHXtDxLL0nfPxuBAqGmxo8u83W8/5trb1EfZd7WL5oA
         VwFKxnfLnPbuC2xe2bX189AFmXVu8bMJfbIY6cbO87wwkFGQjsYhHjCNXkOewQeOPEuv
         aaByz0tsUiNoX8bjWJi+OrDVXzv+HxzeLBXBLnC9hb1fQwbqMNE61QBwJLBwzTjWTjzH
         gdzmXokg4fG5Tu9AuRqHrlNhY1oRweSFB/L9ZEv43woC07+3Kc0lVkGkfdPTAhwq7Nln
         2Wzw==
X-Forwarded-Encrypted: i=1; AL+hErGdHIbyniqdwRYPRCXVb7eIZ8Jb/+iJJWjLyyNFyVy0TarOIFCh8FiptQ6Xqwv4r+yS5HuN@lists.linux.dev
X-Gm-Message-State: APuU4Z8BP+YJSTIlF7xYq+l6wk0I/1ECVAJ2jeH88y6kEfUZIWfqWxC2
	E/m7PuKTjUceSXbeORpMWudf2W1bA3mLqdy60x6SNn/G/UqsOK0PnVkPLIu3d3uzZ8gvm7dqjhH
	fZumyyn4I5uiDic4wy9uJtnE4dwgVMBc+NtOAqKtgWA==
X-Gm-Gg: AYBFou2KTPgli1L/KPXNQKq47js55OAh42DqsNjRjfjMV+LwzlkqzpYRIQhhpvWFHwr
	xXqbc4DTjPwzLj4HY4EFa/VKwWOBPWwU8czM5W3qSQRKNv6GaeVqc45I66Qcc0sqMW64tfmgtqv
	8WNCJxNmnBkrLr3v9NLMSQH1kN7p8LPSjdqU6zANl7OxB+u/rVu8IFsxzJDY/Ru9EEIgx90i2oy
	xNpmWDyhQqDcfii5ll9ba7dStX3MoPcgoYoxtPd1ZHxoCFwGPE+ye6JaO2fAoY4+w18unv0tEfb
	VLI5WyaYE3yARjEc5AGYhcDIKudv+0dFo1x1ThplwfaRObMkmZcUYc7qPtvsIQzw5CR+MqQ38RG
	gyniq59Ni71fAr1MZ7D/tgGvEWGrNLcWriaLYUZxNRONLZlrHfw6qZwrnHvOJfl5heO6OZA==
X-Received: by 2002:a17:906:f183:b0:c2e:3698:dbba with SMTP id
 a640c23a62f3a-c509642ceeamr126451666b.4.1794557481497; Fri, 13 Nov 2026
 00:11:21 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112134700.372702-2-jinpu.wang@cloud.ionos.com> <202611130354.oOiDWpa1-lkp@intel.com>
In-Reply-To: <202611130354.oOiDWpa1-lkp@intel.com>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Fri, 13 Nov 2026 09:11:10 +0100
X-Gm-Features: AclHuK_ijeVtZl53-Nr24xIboJn-g0mWRkSzGcLkYkpL9J_f9DfqfuDTwKSOTUg
Message-ID: <CAMGffE=bCVxcuDzUdGk=btfu-bdHhwofHQ6qkgx7UmQTpvSyhQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] block: suspend bio based disks around queue limits updates
To: kernel test robot <lkp@intel.com>, sashiko-reviews@lists.linux.dev
Cc: Yu Kuai <yukuai@fygo.io>, Song Liu <song@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Li Nan <magiclinan@didiglobal.com>, Xiao Ni <xiao@kernel.org>, linux-raid@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, all

I will fix the __releases(&disk->queue->limits_lock) annotation in
next version, will wait a bit if any other comments.

Thanks!


On Thu, Nov 12, 2026 at 8:18=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Jack,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jack-Wang/block-su=
spend-bio-based-disks-around-queue-limits-updates/20261112-144659
> base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> patch link:    https://lore.kernel.org/r/20261112134700.372702-2-jinpu.wa=
ng%40cloud.ionos.com
> patch subject: [PATCH v4 1/2] block: suspend bio based disks around queue=
 limits updates
> config: arm-randconfig-1002-20261112 (https://download.01.org/0day-ci/arc=
hive/20261113/202611130354.oOiDWpa1-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1=
b1fed44d3dcca649a9877915d57c3357a98124e)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261113/202611130354.oOiDWpa1-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611130354.oOiDWpa1-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from block/blk-map.c:12:
> >> block/blk.h:680:10: warning: releasing mutex 'disk->queue->limits_lock=
' that was not held [-Wthread-safety-analysis]
>      680 |                 return queue_limits_commit_update(disk->queue,=
 lim);
>          |                        ^
>    block/blk.h:681:9: warning: releasing mutex 'disk->queue->limits_lock'=
 that was not held [-Wthread-safety-analysis]
>      681 |         return queue_limits_commit_update_frozen(disk->queue, =
lim);
>          |                ^
>    2 warnings generated.
> --
>    In file included from block/blk-sysfs.c:14:
> >> block/blk.h:680:10: warning: releasing mutex 'disk->queue->limits_lock=
' that was not held [-Wthread-safety-analysis]
>      680 |                 return queue_limits_commit_update(disk->queue,=
 lim);
>          |                        ^
>    block/blk.h:681:9: warning: releasing mutex 'disk->queue->limits_lock'=
 that was not held [-Wthread-safety-analysis]
>      681 |         return queue_limits_commit_update_frozen(disk->queue, =
lim);
>          |                ^
> >> block/blk-sysfs.c:909:3: warning: mutex '(kobj - #undefined)->queue->l=
imits_lock' is not held on every path through here [-Wthread-safety-analysi=
s]
>      909 |                 blk_disk_resume(disk);
>          |                 ^
>    block/blk-sysfs.c:897:9: note: mutex acquired here
>      897 |                 lim =3D queue_limits_start_update(q);
>          |                       ^
>    3 warnings generated.
>
>
> vim +680 block/blk.h
>
>    675
>    676  static inline int blk_disk_commit_limits(struct gendisk *disk,
>    677                                           struct queue_limits *lim=
)
>    678  {
>    679          if (disk->fops->suspend)
>  > 680                  return queue_limits_commit_update(disk->queue, li=
m);
>    681          return queue_limits_commit_update_frozen(disk->queue, lim=
);
>    682  }
>    683
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
