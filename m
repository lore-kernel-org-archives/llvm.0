Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4980F168
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 23:23:52 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id f5so3887165pgk.12
        for <llvm@lists.linux.dev>; Thu, 06 Jan 2022 15:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tA6UK24AjxIZbFxR8bfz/TxU3vWQsg6ckR6coRFMG9M=;
        b=hpqplUo9NjouO1Uj3U3bTzajcYggQzKmWFru89eqsz9f5u1Peh4w1SJiVhTz8GId2h
         b2jESvhCWATWnf/bGxEIVV2c80pnBKhgnKqSvteuQMtIzwEnriEWQKdYQ26+J73rm1KK
         h/IoHYX5zWfyTl5/M2nPICXemTvSH/f4kQBxX+FkhnLq701WrzqudFEJU61jDXuRPXkp
         Kla8GUuZACOR45U8GoVpI4gqU22nnEC07VaPHpULxKIxD2jDGe/JpRwGa+OWL6P1Rw4l
         nxCq6CuV0NaYDqaQ7+bKMNrbnWvXDnCdsWSqQQ5FlRsiTMplDyH9yBWZBi+4NXqwyVIa
         Omsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tA6UK24AjxIZbFxR8bfz/TxU3vWQsg6ckR6coRFMG9M=;
        b=Ffv9WpQxDzjSFa+XXyxINkUUiZMpv4ixP7tpSezvLZFZolXBqKr+GwIuQwFtJpIqgy
         vXvxBHA9DjD8anhJK0r4ljWTTmuqlIG6lHYoWtnrM7m7DZVuExdubvYtNE6YcAN4ps90
         tfIKZiu7IzhJcH9MDPiAB4XrIhCl4cKQxZDrsZGBlJIxqkfsucQ4GIuBndceQnq6pXJp
         D0tO8ZHTibeXy0MdN/cVtBlgvZQeQno5Eel2cLshCH2SmJw9CdJ9GtdoVYXKVErTFbhq
         S+OjSG6s0OmqdBF/chNREhS6d5VWR1dWi2dEN5BHTxo4b2KXYxlNc3Ik72kIL7mL8LMY
         2X7A==
X-Gm-Message-State: AOAM530WOLwe+0kb4bH3i6n7zwSp/K3rWLHK+Io3wxfUWNK2xeDC4nn+
	YG6hBkrH+t/WuCTQh5PbTY0=
X-Google-Smtp-Source: ABdhPJzLjNEAnwHzhwbXnJoVtPzugA8gFSrPCQmEtpnU8iJMKCVbIym3jojydUwKQyOgfeulw1Pucw==
X-Received: by 2002:a63:3509:: with SMTP id c9mr51184737pga.332.1641511431800;
        Thu, 06 Jan 2022 15:23:51 -0800 (PST)
Received: from szeter (n220-236-173-54.sbr3.nsw.optusnet.com.au. [220.236.173.54])
        by smtp.gmail.com with ESMTPSA id i17sm3424104pfk.44.2022.01.06.15.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 15:23:51 -0800 (PST)
Date: Fri, 7 Jan 2022 10:23:07 +1100
From: Samuel Zeter <samuelzeter@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH 0/2] *** Fix reformat_objdump.awk ***
Message-ID: <Ydd522/ivtZunIXl@szeter>
References: <20220106023606.283953-1-samuelzeter@gmail.com>
 <Ydc8wUjX4hnHg7ZE@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ydc8wUjX4hnHg7ZE@archlinux-ax161>

Thanks for the feedback, Nathan.

> For the future, I recommend putting the maintainers in the "To" field,
> rather than "Cc", to ensure they actually see it. Additionally, I see
> some small nits in the commit message that the tip maintainers might
> comment on, see
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog
> 
Thanks for the link, I missed that one. What were the nits apparent to you
in the commit message?

Sam.
