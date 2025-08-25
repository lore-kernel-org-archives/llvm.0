Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35444A08;
	Mon, 25 Aug 2025 01:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756084034; cv=none; b=bdBqMoPbwfu0u+HU/NC5I1a7uw/jkGsk7B5Bj9bbDtU8EuiPHnkcb1rzlUGnk8lU1C6oXJfudK060f3L8C/lofRsv0l2UERo1j4Tixr9XTBeEQ5YWW+jnN1FvlOFN0KdcpS7Qpxb1MgDFH6+txcxWhK0A2OTPi9oHnE6obvP3kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756084034; c=relaxed/simple;
	bh=qzvjptTdbu1HRrNm17uglIEKW/C3ojiHltnOpJd8zPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGHCQDm0HgfOsygrKM5EXw+qjsSx2pDsC04IimRZjlXZAWL2Z9dq/pBnx35a8ylN3A5rP+MLUmbfk4MjLecrI28ARgHru6ogvReqxh13XITSEYfq+hSkOQs/JaCClTs1ws5vtAKws3A1opfaY+zf/aWMhVePluus9d7Wu1gJs2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=UnFCW2Jv; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="UnFCW2Jv"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1756084023; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=hT7fyki4cRVVgwQPXO+m+tGFXjnan9mDi20ca9rK7Dw=;
	b=UnFCW2Jvw40YBuQq9nQKWhWcZOIhKAsqXz84ruyZUWh1yy2xJEEKN04AOs2ZR0Wm/S9LUDE+0kFiGPfPc+ewS4S11zLCOyNOoDDE+ej8oAqSYuCzEGp93C9ZrNVP81gt+ZzuqZByyy0amQxqyWGbfPmdiHRhZuYm+2eb4hp/CF0=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WmPcp-O_1756083701 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 25 Aug 2025 09:01:42 +0800
Date: Mon, 25 Aug 2025 09:01:41 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Lance Yang <lance.yang@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	paulmck@kernel.org, john.ogness@linutronix.de,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] panic: Clean up message about deprecated
 'panic_print' parameter
Message-ID: <aKu19RZ4tffb8eNC@U-2FWC9VHC-2323.local>
References: <aKRJKZHgcxyNF3y7@pathway.suse.cz>
 <202508200907.PsZ3geub-lkp@intel.com>
 <ae9bb2ea-c6e5-4a4b-ae25-aea1d6fe084d@linux.dev>
 <33a897b4-7d9a-4641-9c7a-07c19bb9cb6f@linux.dev>
 <7a34da58-874d-4271-9dbb-7991468d58ff@linux.dev>
 <aKWWcPOf9qPIoCe4@pathway.suse.cz>
 <aKWYELPjbhC7R8NO@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKWYELPjbhC7R8NO@pathway.suse.cz>

On Wed, Aug 20, 2025 at 11:40:32AM +0200, Petr Mladek wrote:
> Remove duplication of the message about deprecated 'panic_print'
> parameter.
> 
> Also make the wording more direct. Make it clear that the new
> parameters already exist and should be used instead.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Thanks for the cleanup!

Reviewed-by: Feng Tang <feng.tang@linux.alibaba.com>

> ---
> Changes since v1:
> 
>   - fixed compilation with CONFIG_SYSCTL disabled (kernel test
>     robot <lkp@intel.com>)
> 
> Thanks Lance Yang <lance.yang@linux.dev> for debugging the compilation
> error reported by the test robot.
> 
>  kernel/panic.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/panic.c b/kernel/panic.c
> index 12a10e17ab4a..24bca263f896 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -77,6 +77,11 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
>  
>  EXPORT_SYMBOL(panic_notifier_list);
>  
> +static void panic_print_deprecated(void)
> +{
> +	pr_info_once("Kernel: The 'panic_print' parameter is now deprecated. Please use 'panic_sys_info' and 'panic_console_replay' instead.\n");
> +}
> +
>  #ifdef CONFIG_SYSCTL
>  
>  /*
> @@ -125,7 +130,7 @@ static int proc_taint(const struct ctl_table *table, int write,
>  static int sysctl_panic_print_handler(const struct ctl_table *table, int write,
>  			   void *buffer, size_t *lenp, loff_t *ppos)
>  {
> -	pr_info_once("Kernel: 'panic_print' sysctl interface will be obsoleted by both 'panic_sys_info' and 'panic_console_replay'\n");
> +	panic_print_deprecated();
>  	return proc_doulongvec_minmax(table, write, buffer, lenp, ppos);
>  }
>  
> @@ -944,13 +949,13 @@ core_param(panic_console_replay, panic_console_replay, bool, 0644);
>  
>  static int panic_print_set(const char *val, const struct kernel_param *kp)
>  {
> -	pr_info_once("Kernel: 'panic_print' parameter will be obsoleted by both 'panic_sys_info' and 'panic_console_replay'\n");
> +	panic_print_deprecated();
>  	return  param_set_ulong(val, kp);
>  }
>  
>  static int panic_print_get(char *val, const struct kernel_param *kp)
>  {
> -	pr_info_once("Kernel: 'panic_print' parameter will be obsoleted by both 'panic_sys_info' and 'panic_console_replay'\n");
> +	panic_print_deprecated();
>  	return  param_get_ulong(val, kp);
>  }
>  
> -- 
> 2.50.1
