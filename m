Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FC884D02
	for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 19:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722282960; cv=none; b=NG5CcpDvaqg1imG9ZY3jBFmsHegYwKUtolA/F25V3mpse9BfZy9oc6CHa72b1Rd3eHY1jHQMlV1+V7hNHEC0Rc1u73qFmszmp56+AeY8zjbc9Az0dHsBW1Z87arQVAOdhpDztodVh2rEtTve58+eBlyrxJeMyzb6n+inMuACTLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722282960; c=relaxed/simple;
	bh=3AkkoW0brko4CSULSsht6h2RUZnglPCwxJFlP8TBv04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Xh1+EC79pYnEhcjMUDx1uLMAVfY8j1mc+wfXhE4xNRxRpUWTwLVnqXPyxIIyu7UoGgMu0EE/ExSdz4dNH/eobffzceKUAGFpGQjsosffGtwN6qmDD6OaWGezrNiD50+XhYKR7DjQ5+oEotmDf44tkYAQ1UV7CWNawTbBROq3OFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1N7gOaQ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1N7gOaQ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7d26c2297eso456730166b.2
        for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 12:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722282956; x=1722887756; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=273lX3HyiOC3OCnJlLwwSKLR5kGSwnwVrAzsymmKo90=;
        b=O1N7gOaQC2MjkrKTg0DDvtmcuWj51hjQ3lHqevSLUaqvMnaqY0JMm+whACBBLIVUiS
         g0kQeHabfcxIVwrMRYTrP7Sgdf6fdtq+EIQKJbpOFkfTFWGe5stONJa0wELgsBOO9MXv
         t8oDslMZRIjhm9kfk2MokIoiShyeroF8Ytt7MabGYgGQNB5DAM+EDFBf7xB4sn1nRsf6
         fa5uI7wtwHfJ+BSuIhxCeOIQgGUTA0lzVNEGgz6wUNNK2Cy0unnapUQPgplP/uq7Rehm
         4zWCNEyge2yV39qlfo4vY8dlWdxSubH0UV9LHCW3PJwDcQtKY7ANcU7bM03sOlgWQivq
         qWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722282956; x=1722887756;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=273lX3HyiOC3OCnJlLwwSKLR5kGSwnwVrAzsymmKo90=;
        b=Z9DWaRDGcb4tZ9Oi3ixiqedBui0HCnPZf+dAuJ07+if/8ocBWQVdDQZFjk007Gl2nh
         bE8REGpJVEicixO3emtpKPdOg3/atWvI2If/sCADqdq3b1da9SoOKFBkAy5pT1KbwPfb
         h8Pu/4L95yI1tRAT16eAxEWC4I/C8rKziQcWlp2b8vMetL5ZFPKO5JtqGK1/GesvAWGe
         keqL0J4uaZOgVMsP+mPiTS44inyOqDEeQaHRsF3GulE0wtmJDf+J3vT9mwFhGyYsTtDm
         6XG3KfZWnB23kEG1lDRHlMBLQ3SzBaaxg7NrXZQlQCsITQcnnkq23TMAuf3YhF3flJAG
         dCWg==
X-Forwarded-Encrypted: i=1; AJvYcCXigTiiSNtF4Jm38iqi2JVBobAY/sye9tZ2r7/mTul4QoK50qu81dsJYtmzPYhr9HOXBY1XMnE3qq6ZksJE09WJk4rrjw==
X-Gm-Message-State: AOJu0Yy/lJduKe1z+QhTP0wzcq5Nu2lQpuU4BJSf2laNKOEqHx41cZVA
	bpDkv51gMmTLIPMTRGAn1/A8xUV+He5KH+BUF33VGVxw7nfxf2Of
X-Google-Smtp-Source: AGHT+IE21VXgcKxJgv01alHZqx0C2xVwmc+SBmW2YzF9IIA5VpRxkdlC9f5/s3JKnEPZ0dVYElcAMQ==
X-Received: by 2002:a17:907:9409:b0:a77:c976:2987 with SMTP id a640c23a62f3a-a7d4006cb89mr588196966b.29.1722282955370;
        Mon, 29 Jul 2024 12:55:55 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab5151csm544902266b.74.2024.07.29.12.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 12:55:54 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 29 Jul 2024 21:55:35 +0200
Subject: [PATCH] clang-format: Update with v6.11-rc1's `for_each` macro
 list
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-clang-format-for-each-macro-update-v1-1-9c554ecfec3e@gmail.com>
X-B4-Tracking: v=1; b=H4sIALbzp2YC/x2NQQqDQBAEvyJzzsBmkcjmKyGHYWx1QF2ZNSEg/
 j2bnIqqQ/dBBW4odG8OcrytWF6rXC8N6STrCLa+OsUQ29DFxDrXykP2RfYfGKITL6Ke+bX1soN
 voQW6pBKTUB3aHIN9/ieP53l+ATtDmT50AAAA
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722282953; l=7212;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=3AkkoW0brko4CSULSsht6h2RUZnglPCwxJFlP8TBv04=;
 b=YuOD0Mxh12zGJLIy9wEegrdyBcL2s3EV3i/RGukWfK/x8iNAwKISdCufsnQWbVqBhJj3sJPuX
 30SmeJL7zaeBJji/irxCtlCtCSvE2ibUPbVI7GB3xmRx/5vhVURY0gG
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Re-run the shell fragment that generated the original list.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Note that commit 4792f9dd1293 ("clang-format: Update with the latest
for_each macro list") added the macro `displayid_iter_for_each`, which
is not part of include/ and tools/ (it is defined in
drivers/gpu/drm/drm_displayid_internal.h), and the shell fragment used
to update the list will drop it. In order to keep the macro on the list,
manual intervention will always be required.
---
 .clang-format | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/.clang-format b/.clang-format
index 252820d9c80a..95b6d333b6e1 100644
--- a/.clang-format
+++ b/.clang-format
@@ -141,11 +141,14 @@ ForEachMacros:
   - 'damon_for_each_target_safe'
   - 'damos_for_each_filter'
   - 'damos_for_each_filter_safe'
+  - 'damos_for_each_quota_goal'
+  - 'damos_for_each_quota_goal_safe'
   - 'data__for_each_file'
   - 'data__for_each_file_new'
   - 'data__for_each_file_start'
   - 'device_for_each_child_node'
   - 'displayid_iter_for_each'
+  - 'device_for_each_child_node_scoped'
   - 'dma_fence_array_for_each'
   - 'dma_fence_chain_for_each'
   - 'dma_fence_unwrap_for_each'
@@ -172,11 +175,14 @@ ForEachMacros:
   - 'drm_for_each_plane'
   - 'drm_for_each_plane_mask'
   - 'drm_for_each_privobj'
-  - 'drm_gem_for_each_gpuva'
-  - 'drm_gem_for_each_gpuva_safe'
+  - 'drm_gem_for_each_gpuvm_bo'
+  - 'drm_gem_for_each_gpuvm_bo_safe'
   - 'drm_gpuva_for_each_op'
   - 'drm_gpuva_for_each_op_from_reverse'
+  - 'drm_gpuva_for_each_op_reverse'
   - 'drm_gpuva_for_each_op_safe'
+  - 'drm_gpuvm_bo_for_each_va'
+  - 'drm_gpuvm_bo_for_each_va_safe'
   - 'drm_gpuvm_for_each_va'
   - 'drm_gpuvm_for_each_va_range'
   - 'drm_gpuvm_for_each_va_range_safe'
@@ -192,11 +198,11 @@ ForEachMacros:
   - 'dsa_switch_for_each_port_continue_reverse'
   - 'dsa_switch_for_each_port_safe'
   - 'dsa_switch_for_each_user_port'
+  - 'dsa_switch_for_each_user_port_continue_reverse'
   - 'dsa_tree_for_each_cpu_port'
   - 'dsa_tree_for_each_user_port'
   - 'dsa_tree_for_each_user_port_continue_reverse'
   - 'dso__for_each_symbol'
-  - 'dsos__for_each_with_build_id'
   - 'elf_hash_for_each_possible'
   - 'elf_symtab__for_each_symbol'
   - 'evlist__for_each_cpu'
@@ -216,6 +222,7 @@ ForEachMacros:
   - 'for_each_and_bit'
   - 'for_each_andnot_bit'
   - 'for_each_available_child_of_node'
+  - 'for_each_available_child_of_node_scoped'
   - 'for_each_bench'
   - 'for_each_bio'
   - 'for_each_board_func_rsrc'
@@ -234,6 +241,7 @@ ForEachMacros:
   - 'for_each_card_widgets_safe'
   - 'for_each_cgroup_storage_type'
   - 'for_each_child_of_node'
+  - 'for_each_child_of_node_scoped'
   - 'for_each_clear_bit'
   - 'for_each_clear_bit_from'
   - 'for_each_clear_bitrange'
@@ -251,6 +259,7 @@ ForEachMacros:
   - 'for_each_cpu'
   - 'for_each_cpu_and'
   - 'for_each_cpu_andnot'
+  - 'for_each_cpu_from'
   - 'for_each_cpu_or'
   - 'for_each_cpu_wrap'
   - 'for_each_dapm_widgets'
@@ -269,13 +278,14 @@ ForEachMacros:
   - 'for_each_element'
   - 'for_each_element_extid'
   - 'for_each_element_id'
+  - 'for_each_enabled_cpu'
   - 'for_each_endpoint_of_node'
   - 'for_each_event'
   - 'for_each_event_tps'
   - 'for_each_evictable_lru'
   - 'for_each_fib6_node_rt_rcu'
   - 'for_each_fib6_walker_rt'
-  - 'for_each_free_mem_pfn_range_in_zone'
+  - 'for_each_file_lock'
   - 'for_each_free_mem_pfn_range_in_zone_from'
   - 'for_each_free_mem_range'
   - 'for_each_free_mem_range_reverse'
@@ -286,15 +296,18 @@ ForEachMacros:
   - 'for_each_group_member'
   - 'for_each_group_member_head'
   - 'for_each_hstate'
+  - 'for_each_hwgpio'
   - 'for_each_if'
   - 'for_each_inject_fn'
   - 'for_each_insn'
+  - 'for_each_insn_op_loc'
   - 'for_each_insn_prefix'
   - 'for_each_intid'
   - 'for_each_iommu'
   - 'for_each_ip_tunnel_rcu'
   - 'for_each_irq_nr'
   - 'for_each_lang'
+  - 'for_each_link_ch_maps'
   - 'for_each_link_codecs'
   - 'for_each_link_cpus'
   - 'for_each_link_platforms'
@@ -332,6 +345,9 @@ ForEachMacros:
   - 'for_each_new_plane_in_state_reverse'
   - 'for_each_new_private_obj_in_state'
   - 'for_each_new_reg'
+  - 'for_each_nhlt_endpoint'
+  - 'for_each_nhlt_endpoint_fmtcfg'
+  - 'for_each_nhlt_fmtcfg'
   - 'for_each_node'
   - 'for_each_node_by_name'
   - 'for_each_node_by_type'
@@ -387,12 +403,15 @@ ForEachMacros:
   - 'for_each_reloc_from'
   - 'for_each_requested_gpio'
   - 'for_each_requested_gpio_in_range'
+  - 'for_each_reserved_child_of_node'
   - 'for_each_reserved_mem_range'
   - 'for_each_reserved_mem_region'
+  - 'for_each_rtd_ch_maps'
   - 'for_each_rtd_codec_dais'
   - 'for_each_rtd_components'
   - 'for_each_rtd_cpu_dais'
   - 'for_each_rtd_dais'
+  - 'for_each_rtd_dais_reverse'
   - 'for_each_sband_iftype_data'
   - 'for_each_script'
   - 'for_each_sec'
@@ -533,8 +552,6 @@ ForEachMacros:
   - 'lwq_for_each_safe'
   - 'map__for_each_symbol'
   - 'map__for_each_symbol_by_name'
-  - 'maps__for_each_entry'
-  - 'maps__for_each_entry_safe'
   - 'mas_for_each'
   - 'mci_for_each_dimm'
   - 'media_device_for_each_entity'
@@ -560,7 +577,9 @@ ForEachMacros:
   - 'netdev_hw_addr_list_for_each'
   - 'nft_rule_for_each_expr'
   - 'nla_for_each_attr'
+  - 'nla_for_each_attr_type'
   - 'nla_for_each_nested'
+  - 'nla_for_each_nested_type'
   - 'nlmsg_for_each_attr'
   - 'nlmsg_for_each_msg'
   - 'nr_neigh_for_each'
@@ -579,6 +598,7 @@ ForEachMacros:
   - 'perf_config_sections__for_each_entry'
   - 'perf_config_set__for_each_entry'
   - 'perf_cpu_map__for_each_cpu'
+  - 'perf_cpu_map__for_each_cpu_skip_any'
   - 'perf_cpu_map__for_each_idx'
   - 'perf_evlist__for_each_entry'
   - 'perf_evlist__for_each_entry_reverse'
@@ -639,7 +659,6 @@ ForEachMacros:
   - 'shost_for_each_device'
   - 'sk_for_each'
   - 'sk_for_each_bound'
-  - 'sk_for_each_bound_bhash2'
   - 'sk_for_each_entry_offset_rcu'
   - 'sk_for_each_from'
   - 'sk_for_each_rcu'
@@ -653,6 +672,7 @@ ForEachMacros:
   - 'snd_soc_dapm_widget_for_each_path_safe'
   - 'snd_soc_dapm_widget_for_each_sink_path'
   - 'snd_soc_dapm_widget_for_each_source_path'
+  - 'sparsebit_for_each_set_range'
   - 'strlist__for_each_entry'
   - 'strlist__for_each_entry_safe'
   - 'sym_for_each_insn'
@@ -662,7 +682,6 @@ ForEachMacros:
   - 'tcf_act_for_each_action'
   - 'tcf_exts_for_each_action'
   - 'ttm_resource_manager_for_each_res'
-  - 'twsk_for_each_bound_bhash2'
   - 'udp_portaddr_for_each_entry'
   - 'udp_portaddr_for_each_entry_rcu'
   - 'usb_hub_for_each_child'
@@ -686,6 +705,9 @@ ForEachMacros:
   - 'xbc_node_for_each_child'
   - 'xbc_node_for_each_key_value'
   - 'xbc_node_for_each_subkey'
+  - 'ynl_attr_for_each'
+  - 'ynl_attr_for_each_nested'
+  - 'ynl_attr_for_each_payload'
   - 'zorro_for_each_dev'
 
 IncludeBlocks: Preserve

---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240729-clang-format-for-each-macro-update-604ee79ca29a

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

