Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACDB22CBF1;
	Tue, 10 Jun 2025 13:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562403; cv=none; b=MOpzN9HIOJFJkQdGKD9Y9PCrG8KGX8icnkn8BHmYhMrDyF6FVeqeyfouNN2dHGE+a3KBTu+ExZa0xfojcjQmJMm7c8EycU9rjeCSnRM96kdMrXBpU1oqRBx96nEE1f81VAAal9ryaTJj9ML1MXz7r+GPfiWEzi+JL0bZnRa/CMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562403; c=relaxed/simple;
	bh=I/Z1CrFbcM3GaI3dyJzJ84n5U/z193agS72haYQlncM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rkzhZqPzNqGLUJV7BJVoC/Oei/pZktFXqu5yIzleXI72hYH2oGEHx7Lmkoygxaj6Z8vVJJ2OxKO3/Srazb5Hl4Dc95CKAXWVpU7lTZ/vtJQ6WEEfNPWipYo5VewGcDKYV3ko1A4J8ciqrxYiZFi60AGHaRw+NdMGYb46omZ+rmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0qdd/Jk; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0qdd/Jk"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acb5ec407b1so983417266b.1;
        Tue, 10 Jun 2025 06:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749562400; x=1750167200; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rStFFasi9wKnfuXYGKZXngpt0H1gmjEVwOvEne1l68w=;
        b=M0qdd/JkJzpiuicIeea+J0ZMNRiYORwDe/sJzMazoa+WPGXceLCHAuhbXWUzjZ59uP
         xrC1fam8N8oIdrZoq7geiBcnCt/w7IAB0HhsUbcmjZ+EBEtOX/l5/anxKa1YUNIB+KN6
         lqCtbSOA6XWQRTTSJEVa4O5nY4za4H71JdP5zMOTKVKUu0quMO8HBKa2qJ3nCpZ5bs08
         VxPuDW9RdGf/2HP9LJ2p0Ow70vCW7yrvXPK1F7fipwydtMrp2pnOlBDwTmSi3KmRtg4Z
         sxiZqIo0OdRCA8Yw+FicLS/SPExQU6BCOP02GjLmURpMh7TNRyD5ouvjNbctYScRB7UP
         DY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562400; x=1750167200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rStFFasi9wKnfuXYGKZXngpt0H1gmjEVwOvEne1l68w=;
        b=PlhoomjVlQcZeDh9S/8UDDgzxdm8hzRVvLFuwT4ZYHO3Pxkd2PlM/XYfLLYvwcaF5O
         ZMmGFAlvXJduVgUvTDYru+qnjOGpcZYxiosUdElKbhfH++hvNNoPGqRfLkmi/R2E6Ue1
         m8rjKLLKWq8+vhxlx7PxgeAtwTyHaDaNbjehTsNeKHOhU1vDF6EXWsExDeUkbcMXPTPd
         jUYoLKMYzOsMezdFaVVDSBvotiCUJSPG4U8hr4OAn3W1+EYfaQwEVZqjvA+V0JSAVxui
         u8LuhDsaey0v/VXXIUM8ZRJ0a4D0lOuygcMbDFzInGWCcMZhWIoAjTI3Axyti2xuRSo2
         Sw4w==
X-Forwarded-Encrypted: i=1; AJvYcCVO4gPSget1XXpzVK1YVhX+de0PGrJHD7WFsjyf/ILP6D2bChwz66by3m3by/ovxcxgQiG8oxfzbVLBjSbV@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2C/yzwdfhSL7MTxuMhqiTZUjJ3RsM2Et56H1zSukjyWlxBZkq
	9xQkMF+K1IAjXw09tkjwxTqGHrY0ajPECuafByRWtbG6pjpxwDl/XLqS
X-Gm-Gg: ASbGncuymkQTKt8+8he4oHd81EI/+81EDsopRoKJWGpdT1jkhIjIRzmge62tJY7dVT0
	2nqbc37NYimAuhrpvC5TNEz8eXWKMp1Ke2G+upkJwKaQ0yomQ5C2ZtjUB6YNrkFRemzhoezIeDn
	BYJataV/cEoWbkN5G902oGX3WxYfTFvPjpIImjN7b3Yv2gh5zKLu6WqkO0fyFZUTDdqCd5lMu5b
	Ek/Hl/FRnkjUWjRIxHygPbmlyMQQLJWk1ReOd+T/9+206KCx27N+pExRd1Xw3ozeh1jklzZAL+Y
	zWgSLqwqazAl7k4GN1NP+AVAg+L+WixQAuYnQm2RRnqhQYselgbKge8n5rVjPmHico2sgA==
X-Google-Smtp-Source: AGHT+IG1M19sNDlIpTxYUy5jNl9AaNF5wPetNrRz8SeDwE1eTyzxnOMj31StieI8zqcznp8b50sfCg==
X-Received: by 2002:a17:906:ef0e:b0:add:deb1:d84d with SMTP id a640c23a62f3a-ade1aa5bc20mr1640012966b.1.1749562399633;
        Tue, 10 Jun 2025 06:33:19 -0700 (PDT)
Received: from [192.168.0.50] ([79.119.240.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d753a6csm721053166b.2.2025.06.10.06.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:33:19 -0700 (PDT)
Message-ID: <b8690413-059d-4330-992b-36a7af10aa30@gmail.com>
Date: Tue, 10 Jun 2025 16:33:17 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rtw-next v2 14/14] wifi: rtw89: Enable the new USB modules
To: kernel test robot <lkp@intel.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Ping-Ke Shih <pkshih@realtek.com>
References: <663044d3-0816-4b1b-874d-776835e774e9@gmail.com>
 <202506101956.cNXM2Qvb-lkp@intel.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <202506101956.cNXM2Qvb-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/06/2025 14:55, kernel test robot wrote:
> Hi Bitterblue,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on wireless-next/main]
> [also build test ERROR on wireless/main linus/master v6.16-rc1 next-20250610]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Bitterblue-Smith/wifi-rtw89-8851b-Accept-USB-devices-and-load-their-MAC-address/20250610-033543
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
> patch link:    https://lore.kernel.org/r/663044d3-0816-4b1b-874d-776835e774e9%40gmail.com
> patch subject: [PATCH rtw-next v2 14/14] wifi: rtw89: Enable the new USB modules
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250610/202506101956.cNXM2Qvb-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101956.cNXM2Qvb-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506101956.cNXM2Qvb-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/net/wireless/realtek/rtw89/rtw8851b.c:523:47: error: use of undeclared identifier 'B_AX_SOP_EDSWR'
>      523 |                 rtw89_write32_clr(rtwdev, R_AX_SYS_PW_CTRL, B_AX_SOP_EDSWR);
>          |                                                             ^
>    1 error generated.
> 
Oops, I'll add that to reg.h in v3.
