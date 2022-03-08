Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CDF4AA8
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 17:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E77C340EB;
	Tue,  8 Mar 2022 17:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646759491;
	bh=MAlU9a7tCcCfjXkolJopoDDfdO759yz+D2J+1KsCNaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=In/CbwOFzBoyMoDJcR1dtXQTghfAg8lbf1fYhZ7EK3WiyZT8umVcgYfCONNkItnPJ
	 U6OgM4/0KVkSu78c6O+3KAbcoJCJI/Z9Gz0kFY4vuMyo5uEqC79SwbQv4awtLAjo/3
	 BFbrkwVIRZ7TIV1T9aK4Zx4LeaGS9Ri1421IMZF1lDaqYQvUEZiyZksIAusZ/0ZEmz
	 pDQqkic9YZk+pCG18nr26TvS5qrtXJAc4yyCcIVSWK12tC4NeGvfWPafpxzoDHGsQa
	 4CxWzSTTR0VcRsFCj8YCyjF0bbfFntkmdXOmKAGMGYvkJR6jzo/bJxYAE+MEnleQJ+
	 E+L7jSWPx6Mmw==
Date: Tue, 8 Mar 2022 10:11:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Yifan Zhang <yifan1.zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Felix.Kuehling@amd.com,
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] drm/amdkfd: judge get_atc_vmid_pasid_mapping_info
 before call
Message-ID: <YieOPO1WaQ/VnqdD@dev-arch.thelio-3990X>
References: <20220303080514.680150-1-yifan1.zhang@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303080514.680150-1-yifan1.zhang@amd.com>

On Thu, Mar 03, 2022 at 04:05:13PM +0800, Yifan Zhang wrote:
> Fix the NULL point issue:
> 
> [ 3076.255609] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [ 3076.255624] #PF: supervisor instruction fetch in kernel mode
> [ 3076.255637] #PF: error_code(0x0010) - not-present page
> [ 3076.255649] PGD 0 P4D 0
> [ 3076.255660] Oops: 0010 [#1] SMP NOPTI
> [ 3076.255669] CPU: 20 PID: 2415 Comm: kfdtest Tainted: G        W  OE     5.11.0-41-generic #45~20.04.1-Ubuntu
> [ 3076.255691] Hardware name: AMD Splinter/Splinter-RPL, BIOS VS2326337N.FD 02/07/2022
> [ 3076.255706] RIP: 0010:0x0
> [ 3076.255718] Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
> [ 3076.255732] RSP: 0018:ffffb64283e3fc10 EFLAGS: 00010297
> [ 3076.255744] RAX: 0000000000000000 RBX: 0000000000000008 RCX: 0000000000000027
> [ 3076.255759] RDX: ffffb64283e3fc1e RSI: 0000000000000008 RDI: ffff8c7a87f60000
> [ 3076.255776] RBP: ffffb64283e3fc78 R08: ffff8c7d88518ac0 R09: ffffb64283e3fa60
> [ 3076.255791] R10: 0000000000000001 R11: 0000000000000001 R12: 000000000000000f
> [ 3076.255805] R13: ffff8c7bdcea5800 R14: ffff8c7a9f3f3000 R15: ffff8c7a8696bc00
> [ 3076.255820] FS:  0000000000000000(0000) GS:ffff8c7d88500000(0000) knlGS:0000000000000000
> [ 3076.255839] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 3076.255851] CR2: ffffffffffffffd6 CR3: 0000000109e3c000 CR4: 0000000000750ee0
> [ 3076.255866] PKRU: 55555554
> [ 3076.255873] Call Trace:
> [ 3076.255884]  dbgdev_wave_reset_wavefronts+0x72/0x160 [amdgpu]
> [ 3076.256025]  process_termination_cpsch.cold+0x26/0x2f [amdgpu]
> [ 3076.256182]  ? ktime_get_mono_fast_ns+0x4e/0xa0
> [ 3076.256196]  kfd_process_dequeue_from_all_devices+0x49/0x70 [amdgpu]
> [ 3076.256328]  kfd_process_notifier_release+0x187/0x2b0 [amdgpu]
> [ 3076.256451]  ? mn_itree_inv_end+0xdc/0x110
> [ 3076.256463]  __mmu_notifier_release+0x74/0x1f0
> [ 3076.256474]  exit_mmap+0x170/0x200
> [ 3076.256484]  ? __handle_mm_fault+0x677/0x920
> [ 3076.256496]  ? _cond_resched+0x19/0x30
> [ 3076.256507]  mmput+0x5d/0x130
> [ 3076.256518]  do_exit+0x332/0xaf0
> [ 3076.256526]  ? handle_mm_fault+0xd7/0x2b0
> [ 3076.256537]  do_group_exit+0x43/0xa0
> [ 3076.256548]  __x64_sys_exit_group+0x18/0x20
> [ 3076.256559]  do_syscall_64+0x38/0x90
> [ 3076.256569]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
> ---
>  .../drm/amd/amdkfd/kfd_device_queue_manager.c  | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 1cd2ea536bd0..77364afdc606 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -505,14 +505,16 @@ static int dbgdev_wave_reset_wavefronts(struct kfd_dev *dev, struct kfd_process
>  	 * to check which VMID the current process is mapped to.
>  	 */
>  
> -	for (vmid = first_vmid_to_scan; vmid <= last_vmid_to_scan; vmid++) {
> -		status = dev->kfd2kgd->get_atc_vmid_pasid_mapping_info
> -				(dev->adev, vmid, &queried_pasid);
> -
> -		if (status && queried_pasid == p->pasid) {
> -			pr_debug("Killing wave fronts of vmid %d and pasid 0x%x\n",
> -					vmid, p->pasid);
> -			break;
> +	if (dev->kfd2kgd->get_atc_vmid_pasid_mapping_info) {
> +		for (vmid = first_vmid_to_scan; vmid <= last_vmid_to_scan; vmid++) {
> +			status = dev->kfd2kgd->get_atc_vmid_pasid_mapping_info
> +					(dev->adev, vmid, &queried_pasid);
> +
> +			if (status && queried_pasid == p->pasid) {
> +				pr_debug("Killing wave fronts of vmid %d and pasid 0x%x\n",
> +						vmid, p->pasid);
> +				break;
> +			}
>  		}
>  	}
>  
> -- 
> 2.25.1
> 
> 

Apologies if this has been reported and fixed already, I have not seen
it if it has.

This patch as commit c8b0507f40de ("drm/amdkfd: judge
get_atc_vmid_pasid_mapping_info before call") in -next causes the
following clang warning, which appears to be legitimate.

  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:508:6: error: variable 'vmid' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
          if (dev->kfd2kgd->get_atc_vmid_pasid_mapping_info) {
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:521:6: note: uninitialized use occurs here
          if (vmid > last_vmid_to_scan) {
              ^~~~
  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:508:2: note: remove the 'if' if its condition is always true
          if (dev->kfd2kgd->get_atc_vmid_pasid_mapping_info) {
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:490:19: note: initialize the variable 'vmid' to silence this warning
          unsigned int vmid;
                           ^
                            = 0
  1 error generated.

Should this function bail out earlier if
->get_atc_vmid_pasid_mapping_info() is NULL, rather than skipping the
for loop?

Cheers,
Nathan
