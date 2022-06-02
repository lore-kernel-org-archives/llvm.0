Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710057F5
	for <llvm@lists.linux.dev>; Thu,  2 Jun 2022 09:22:32 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id 15so4274865pfy.3
        for <llvm@lists.linux.dev>; Thu, 02 Jun 2022 02:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KeRV9VlhwIAyg6EUqX0Fszd3cElW50+A7dVuut11Ql8=;
        b=T+n7HgqhezIBE0FWmfDqATn2184KpAXP/iUBPS/aT4g74LaP8h6NlWCDFhbPl8mpRJ
         R2yGxiwiyV8JqcpCwXj7EqCXJCPx22zf0k73jDaeWTk7K10kUeLuKEuLyuBLeBwxELq1
         j/aQGP/heKZ3lRsUTybuy+Q7zwjfB7TVvuXxZBNZVq15Q62NuqXrA2RriidzxWRpzvIZ
         Wyj2i2HlHc7IwTbPUdXr+RtwmfJo8gSmsrpknYgo0TQNyK1eCEug1LynaOtwjUYzc/YR
         wguayKEzzLIrTNXMPjiVKAUDzMXLboQZn52dz3F3z3KdETWWarbsMWMd7FXWvzIGUBFT
         2TtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KeRV9VlhwIAyg6EUqX0Fszd3cElW50+A7dVuut11Ql8=;
        b=RZguymZ3IKWl/VMPN+FrPIXhmxXoVtuE5JBh2PXus1zosuoMtAis7s4yjUT7nWcyMD
         F1FLycoUzYcHEncnz3yzQscDJrGJhAIgoWdNBURV9zFZ+W6gpfl3HY7VwTHzjCeEU21V
         xmoWMdVWeI5+phBtPRYQd7ucgHJFYv3ZPVlO9hFtchF22Ljb5L0iOOEfLfinB9iMe70y
         5pb4hiGNH7BvwIz+Kq8TsaQxLKgc4W71EHqw/k76NKhB0BfQ6pYMRFlPO+Fk0z3it5M4
         PExyXszISYhwNJAGHEk4XqsbBwEw/VUGkkqwJIBZFEozj1asOQd2WyPqjWRAHxi1z6ap
         +qNA==
X-Gm-Message-State: AOAM532Z09OleLUuzZuJ9Zg0xD3bNVnICyDOoZqMCeOlyx5ywcNCQoig
	ne9MdAmdL+Rb4kbIwnF2Uzc=
X-Google-Smtp-Source: ABdhPJxElJXyhXOh8nC4t31hIdIX4SCbS/dv8nLykVgt//DQhqD96RDYfw60Gxl+zsBbBK6OuVKtcg==
X-Received: by 2002:a63:65c7:0:b0:3fc:85b5:30c0 with SMTP id z190-20020a6365c7000000b003fc85b530c0mr3497048pgb.165.1654161751927;
        Thu, 02 Jun 2022 02:22:31 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-24.three.co.id. [180.214.232.24])
        by smtp.gmail.com with ESMTPSA id 129-20020a621787000000b005180c127200sm2946985pfx.24.2022.06.02.02.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 02:22:30 -0700 (PDT)
Message-ID: <7f1c7301-e622-f177-70ac-d64046347613@gmail.com>
Date: Thu, 2 Jun 2022 16:22:25 +0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3] HID: uclogic: properly format kernel-doc comment for
 hid_dbg() wrappers
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Nikolai Kondrashov <spbnick@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, llvm@lists.linux.dev,
 stable@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220602082321.313143-1-bagasdotme@gmail.com>
 <Yph09N8w4g7+d9ER@kroah.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <Yph09N8w4g7+d9ER@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/2/22 15:29, Greg KH wrote:
> None of this is needed for stable kernels releases as no code is being
> modified.
> 
> thanks,
> 
> greg k-h

Hi Greg,

That's right, however because I don't see any kernel-doc warnings for
hid-uclogic-params.c on linux-5.18.y. These warnings appear only on
mainline.

Thanks for reminding me.

-- 
An old man doll... just what I always wanted! - Clara
