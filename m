Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794521907;
	b=5FylA8nXS9LsxW3fgjalWnkSnkPklP09iLEpDvsnkOIgifFJq8f0t45yeNnU5I/5wnr+
	 ffN7nFcBSQY9xiz524JTcmswyPTkOgls4s7iJSWtBrpjhU4Rrw6hKfNKFweDb0gM7+CAx
	 KVOdWQjyhaOmF5QaNlFxfcSUY9jHOdzfsB52CKAq25QTLZcd1ZEbLl4HwQPWQU9coK1cY
	 9zqaWRLo27CLEhTBTre0XSR71p+DLxMhEXw11b5lOCM7RHi/1Z5GhjQGDqAk+/hjW1jPJ
	 tIO5uojQ8ali3mwjo7FVRY+ciB4CwItLGdclz+Cf3ys96OTqss/mJDWxVaJXn1kNJ3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794521907;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0dA/NIqycRzpuhLSv3g4vQ/6rFJy2VUx9lu4Juz/aDk=;
	b=AjmYWbHCi8hrxLOV53EM41C8By1DYw1SRFSUImzPaNfzVK6SYWk85LgJIttMp5zG3pT4
	 XZc8qfMN8kixx62zaEsz2IheclOaU6Q3N2iHQNJf+qppPtEXHjfAEFqv65OCwshtKLiwr
	 Qr5VDLfvO+lwOZZKZlh5XW8QypiO2TD9IruaICeicpfhmIziRlA4Uxaavms6Z/w8QhgpU
	 veJAX80HrpvzWMaqB6WY7N2lGCV0OkAHviGUOTb5pEijOB+dXGysEtqiDmKdmvY1ieQjn
	 9Q28kxKByM36gThNBSGDYIEOfWC0d/yctZW1WrTaAUtt/V3o6rsaoh9lL9OtfPb9gPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C9FXnGpG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41245606A31C;
	Thu, 12 Nov 2026 22:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C9FXnGpG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DABB1F000C4;
	Thu, 12 Nov 2026 22:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794521906;
	bh=0dA/NIqycRzpuhLSv3g4vQ/6rFJy2VUx9lu4Juz/aDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C9FXnGpGY+4IkI2ZIX6jKtqymE3iTic2OripJWHwneEeQMaEshXYrLCIOKWuIeWRK
	 +GhdPXHbvKp0sJqMH978weqky80PYtuDZ54/nrQ+VQKs51uUGuAwqLcFhld8kmSzfq
	 V2LGzlqfM+qNlBkMGJlE5KQ864WCzRT3KPMOr2GY75RpSwjIKk6Ea/N1ravWcEBn5M
	 AV4lVrdVq9hmTcHvAIhLrNK+a3t0eOaXXnUtjomkmjZwF9aslkc59IAo4kMr1hjJe6
	 ys34LfOqBJGAXs9zbAEmssFEan0C0xfDcP4tBPSv2tB+3bEQBkDHEHHUGCApWjkDMh
	 GPAR1eb+bIrJg==
Date: Thu, 12 Nov 2026 15:18:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Kees Cook <kees@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [linux-next:master 5784/6673] WARNING: modpost: vmlinux: section
 mismatch in reference: seq_buf_terminate+0x2c (section: .text) ->
 bootup_event_buf (section: .init.data)
Message-ID: <20261112221823.GH4107043@ax162>
References: <202611122323.IvGv8FYK-lkp@intel.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202611122323.IvGv8FYK-lkp@intel.com>

On Thu, Nov 12, 2026 at 11:07:45PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   aaa2f954c21b205a0bcd0961e5b2be4e82e58455
> commit: 7b8cd26b6aab8cf147165610d13964f79200a5a7 [5784/6673] seq_buf: Mark a seq_buf overflowed when terminating it loses a byte
> config: arm64-randconfig-1000-20261112 (https://download.01.org/0day-ci/archive/20261112/202611122323.IvGv8FYK-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611122323.IvGv8FYK-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611122323.IvGv8FYK-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x20 (section: .text) -> bootup_event_seq (section: .init.data)
> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x24 (section: .text) -> bootup_event_seq (section: .init.data)
> >> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x2c (section: .text) -> bootup_event_buf (section: .init.data)
> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x40 (section: .text) -> bootup_event_seq (section: .init.data)
> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x44 (section: .text) -> bootup_event_buf (section: .init.data)
> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x94 (section: .text) -> bootup_event_seq (section: .init.data)
> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0xc8 (section: .text) -> bootup_event_seq (section: .init.data)
> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x124 (section: .text) -> bootup_event_seq (section: .init.data)
> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x178 (section: .text) -> bootup_event_buf (section: .init.data)
> WARNING: modpost: vmlinux: section mismatch in reference: seq_buf_terminate+0x17c (section: .text) -> bootup_event_seq (section: .init.data)

It looks like seq_buf_terminate() is not getting inlined (presumably
because this configuration has KCOV and trace branch profiling enabled)
but bootup_event_seq (and by extension, bootup_event_buf) are being sunk
into the outlined seq_buf_terminate() in kernel/trace/trace_events.c? I
guess these functions should maybe be marked as __always_inline?

-- 
Cheers,
Nathan
