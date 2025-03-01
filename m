Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD0463A9
	for <llvm@lists.linux.dev>; Sat,  1 Mar 2025 00:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740788581; cv=none; b=Y1dbegsV1vxXvTXqRBLvbIIn4zxozbHJYpr19T/y+XAPwFzNyYQqBEmuH3rxNcSSe4b2dPsckF54WdbhtgnZ9tBYXiVZU3t2h0bEKGkRsP9U9KOnPMpdN7jhqueqXLjtd3MPBlF2lMvjIFAj1EVB26/YwYu/Wt6eFr5ZNUxgvWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740788581; c=relaxed/simple;
	bh=BJ85jd9LWmkfvxQt+PubnvRoJI2+CN6NMADWkuH7ehQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GmxoX0+gnSK+1bZlhcJQcUOlk3AHlBp/RVcLJr4GsMUXcMBrC8iCF/jgdLJi3x7pm/L3g0LV+ApG2Dj2JWnW8BzYFdDGj7k5abT4HjWXnOIkt41uVGt4KwGU29+olTo2ICMUHKT0mMQlO94fpZQEJuvWhLbj8grhYZkKIAC7X10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmBLSMzs; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmBLSMzs"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390e3b3d432so1882988f8f.2
        for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 16:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740788578; x=1741393378; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJ85jd9LWmkfvxQt+PubnvRoJI2+CN6NMADWkuH7ehQ=;
        b=WmBLSMzs3U+9jBdvHMRtr3VvemybUAOdZxTo8hTePp5ZNGJcnYCs6qUvwL+JgR5fb6
         2EkZ9qx0Yugc0xuu4KnBE1US9tINf73n75iMQt/R+JMkpfMkC6WYoLhhHD4B9en5e4KJ
         c1UbVAZtcK0NAXEpnDBFyTgO4AAiAMBEmBPrJWjkiswkCicIrmzDDDLh+TGqMLWKLUkl
         zJKVqLfSYhLOwr2Ky23ahnzGAanWIpIyQ710ehZefjT/wRZy7G0AfL2mlzMG+0Kp5wvH
         Fl1K8zsbtsWaGxuDl5b/8WkROpZdawFwvQk7TBzavzPp/hSj9Yb0wInjv4PSh5gmQ107
         qmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740788578; x=1741393378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJ85jd9LWmkfvxQt+PubnvRoJI2+CN6NMADWkuH7ehQ=;
        b=WrJZGLIkvzdfdSBnjlFiw09tL13/mGi6ktb/6HQ5ijCn74L3t8pnDMJ8eOA8ZkZV8l
         /O6oCMgzjlaRuXss1p/uAo7AqM8+8efflRHRWbnzQVq3i8XQrbRDacUKwfdDIw0vhe0F
         eiNVde7NsG/hz7fZZVYx/1se2rO5V6IyTmlhpJIZYH7sMgt/mOEGffx5CMg3sl8kA4ca
         IBNZoivabq9BGCG2niI80z9XJVpcxA5wbNl+TBY31FlGreY/234ws85IeStsQ5yRbXwa
         FZxgMFqgHuGqVa5TJRsjoyj0Klq/OYGBoxAIwhuuHcSyawn2Jjwh+OBWk3KRvX1x3+On
         5WOw==
X-Forwarded-Encrypted: i=1; AJvYcCVuqp6IIVeEMp6WHhM+egvXtmpyetoFxf41NTApjnA6BcgEkpMQQ+8V1dyGUCdAls/e5Gt6@lists.linux.dev
X-Gm-Message-State: AOJu0YwJC/l+Mgj65y6/cbPjDGAKEuqn4OF1nvhbwofuHhnyhw1u/lTU
	+ityvtb2QBEvi/5EK/JtrajY/PHf5a4PT6bY570aNzsdNShek8LWj1c7UGCaqrRLF9if6T/r4Rx
	XHpd6mVF9XXcweqRB3A3VU5lsNVw=
X-Gm-Gg: ASbGnctVnzD1XDSdtcM3HvgMaE0ffPa6UCFngnM5a27cG0jZMtEUby6Mi6u+O/Plirf
	kPfwhzTMnFGrZEwFo1NXgKbMpTts45/0BG9j9m5R2+9+7zJBvLSTTW6ZGrAsW1CKQvTYjT3bb82
	JicXDb24TkuAlACXf5ByBB5YfgYwqM
X-Google-Smtp-Source: AGHT+IGOs2J8Ec3SpsExVrc6QQu8Fiv07hIlgJmQJEhCPmeI+K9xrAkJp6tJ/1xDwbSrLdOEQrceGucIYIyYI4ePgr0=
X-Received: by 2002:a05:6000:1849:b0:390:f698:ecd0 with SMTP id
 ffacd0b85a97d-390f698ed13mr2102576f8f.11.1740788577700; Fri, 28 Feb 2025
 16:22:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com>
 <168f775c4587f3a1338271390204a9fe16b150dd.1739866028.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZcVSwUAC9_xtVAHvO6+RWDzt6wOzWN623m=dT-3G=NnTQ@mail.gmail.com>
 <cik7z3nwspdabtw5n2sfoyrq5nqfhuqcsnm42iet5azibsf4rs@jx3qkqwhf6z2>
 <CA+fCnZd6O0_fc1U-D_i2shcF4Td-6389F3Q=fDkdYYXQupX1NA@mail.gmail.com>
 <uup72ceniis544hgfaojy5omctzf7gs4qlydyv2szkr5hqia32@t6fgaxcaw2oi>
 <CA+fCnZfb_cF1gbASZsi6Th_zDwXqu4KMtRUDxbsyfnyCfyUGfQ@mail.gmail.com> <paotjsjnoezcdjj57dsy3ufuneezmlxbc3zk3ebfzuiq722kz2@6vhollkdhul7>
In-Reply-To: <paotjsjnoezcdjj57dsy3ufuneezmlxbc3zk3ebfzuiq722kz2@6vhollkdhul7>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 1 Mar 2025 01:22:46 +0100
X-Gm-Features: AQ5f1Jp9iybs6pTKPBUq6fE1AmEKUlDJIkwe5Kr9NN_-2VapuhLDqeATKkl6mP4
Message-ID: <CA+fCnZcCCXPmeEQw0cyQt7MLchMiMvzfZj=g-95UOURT4xK9KQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: kees@kernel.org, julian.stecklina@cyberus-technology.de, 
	kevinloughlin@google.com, peterz@infradead.org, tglx@linutronix.de, 
	justinstitt@google.com, catalin.marinas@arm.com, wangkefeng.wang@huawei.com, 
	bhe@redhat.com, ryabinin.a.a@gmail.com, kirill.shutemov@linux.intel.com, 
	will@kernel.org, ardb@kernel.org, jason.andryuk@amd.com, 
	dave.hansen@linux.intel.com, pasha.tatashin@soleen.com, 
	guoweikang.kernel@gmail.com, dwmw@amazon.co.uk, mark.rutland@arm.com, 
	broonie@kernel.org, apopple@nvidia.com, bp@alien8.de, rppt@kernel.org, 
	kaleshsingh@google.com, richard.weiyang@gmail.com, luto@kernel.org, 
	glider@google.com, pankaj.gupta@amd.com, pawan.kumar.gupta@linux.intel.com, 
	kuan-ying.lee@canonical.com, tony.luck@intel.com, tj@kernel.org, 
	jgross@suse.com, dvyukov@google.com, baohua@kernel.org, 
	samuel.holland@sifive.com, dennis@kernel.org, akpm@linux-foundation.org, 
	thomas.weissschuh@linutronix.de, surenb@google.com, kbingham@kernel.org, 
	ankita@nvidia.com, nathan@kernel.org, ziy@nvidia.com, xin@zytor.com, 
	rafael.j.wysocki@intel.com, andriy.shevchenko@linux.intel.com, cl@linux.com, 
	jhubbard@nvidia.com, hpa@zytor.com, scott@os.amperecomputing.com, 
	david@redhat.com, jan.kiszka@siemens.com, vincenzo.frascino@arm.com, 
	corbet@lwn.net, maz@kernel.org, mingo@redhat.com, arnd@arndb.de, 
	ytcoode@gmail.com, xur@google.com, morbo@google.com, 
	thiago.bauermann@linaro.org, linux-doc@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 1:33=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> Btw just out of curiosity on the topic. If we used a runtime specified ka=
san
> offset, could the gdb script issue (not knowing the offset at compile-tim=
e) be
> fixed by just exporting the value through sysfs?
>
> I know that in inline mode the compiler would still need to know the offs=
et
> value but I was curious if this approach was okay at least in outline mod=
e?

I think this would work, assuming that GDB can pick it up from sysfs.
