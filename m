Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCAE10F2;
	Sat,  5 Aug 2023 17:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15928C433C8;
	Sat,  5 Aug 2023 17:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1691254834;
	bh=wIh5pBpNw6If64/d3ewV++cp21uC+nTwKb0g7niWahM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vcq/sgwCl+DzqRE7yiW05KcIG+LFl4SPA0a655XwxwereVk4LNKrgfuZhTVuqp3KI
	 HXuEVyyQ9eWntHL85lyZqXBKUu8rXvdwAPbgktKvNZWYy6oyuzMEWSEx05FDdb8Eo9
	 do4a/X+cLGveo4X9ncO0HMrVmprcCwUCbMACkPrM=
Date: Sat, 5 Aug 2023 10:00:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Douglas Anderson <dianders@chromium.org>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-nonmm-unstable 54/56] kernel/watchdog.c:526:36:
 error: too many arguments to function call, expected 0, have 1
Message-Id: <20230805100033.37f1df3bf720a7c21ad8980d@linux-foundation.org>
In-Reply-To: <202308051236.R7HDiE39-lkp@intel.com>
References: <202308051236.R7HDiE39-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 5 Aug 2023 12:30:30 +0800 kernel test robot <lkp@intel.com> wrote:

> >> kernel/watchdog.c:526:36: error: too many arguments to function call, expected 0, have 1
>                            trigger_allbutcpu_cpu_backtrace(smp_processor_id());

Thanks, I did this:

--- a/include/linux/nmi.h~nmi_backtrace-allow-excluding-an-arbitrary-cpu-fix
+++ a/include/linux/nmi.h
@@ -190,7 +190,7 @@ static inline bool trigger_all_cpu_backt
 {
 	return false;
 }
-static inline bool trigger_allbutcpu_cpu_backtrace(void)
+static inline bool trigger_allbutcpu_cpu_backtrace(int exclude_cpu)
 {
 	return false;
 }
_

