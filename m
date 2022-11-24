Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457BB79EE
	for <llvm@lists.linux.dev>; Thu, 24 Nov 2022 22:02:05 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id bs21so4256891wrb.4
        for <llvm@lists.linux.dev>; Thu, 24 Nov 2022 14:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZW5Crr9inY/+lUP1iPzPDtCppBUYD816z3MXFDgda0=;
        b=Zv4JVDDxlKJpQkW+/D7LrFUrk2Rvi5sAW98/3SAYyuQptILGgvL1r4I4RsBNNKNe8G
         xuI6ZwRw7AN7eFwzs4dC2VtKFWgCmLHLfFWHk8BX1AGB7D6PRit4F7XgIOCqpUMlTGDA
         42vuhUxAYF2lACS7jsi8idJygrqfM+N0qD+mL3ua53x5ztvc7GupWde5507jCjk89u9N
         j3vsDxX67x5Nc8oR7cz1+GtsBq9ZydlStSj4gthbR527852SRitF2REvQH0v5H7z5nJP
         XNHmdEPV3y7y/UOF+SvyzAGA++fuePNitxZqzTTBHDqoCVSzFt2XOUC/UlFRXHQV1Dgi
         upcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PZW5Crr9inY/+lUP1iPzPDtCppBUYD816z3MXFDgda0=;
        b=SIDyw2UAfwf4FZkLQo9cJiDoun9FpK7NXTDVzRLqAO8aHvp9mIP1PfBscQdbzumBJu
         kEnznj1cy7/Sln2fFm0cFwUZDNOqicJTsgB4bpB5O2mzQ9GrWHchz2wjBDiQwWEKX8zS
         EV97USY3O3hODfJoDxGshR63wysminGxvN1EOcZxo1bIut3plMGC+tLWucL3E/I4Nnq+
         YOtErP3/Mi5ea2rkxqFkKkIrXe7eH1y6rB/KqnbQOpVxAN7XN1G5ohzyLSQc+OINVHBH
         +wXo0VVTz/SLOwmbm+D6KlJmfZpYtiUu5AzECQKZ4wXMOm/ceTc4BDlxLx+0kCk4f8su
         nY2w==
X-Gm-Message-State: ANoB5pmigoxoJO0+xxtg8pEG6aqtCWanNBbc6x3fh6Imi/T13ePHZX86
	B3bAPZYoaw57gpJxUpi9aSThfg==
X-Google-Smtp-Source: AA0mqf7qOyEQa9gZgfjwrNKDmJpOQdlsBjDm/ylXrTg+uO7lUUnx9oaen4ZxfeMPzRC08hepAKpcHw==
X-Received: by 2002:a5d:5305:0:b0:242:25e:e731 with SMTP id e5-20020a5d5305000000b00242025ee731mr1609233wrv.48.1669327323396;
        Thu, 24 Nov 2022 14:02:03 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id w5-20020adfde85000000b00241cbb7f15csm2227727wrl.106.2022.11.24.14.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 14:02:03 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 24 Nov 2022 22:02:02 +0000 (UTC)
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <580996598.35381.1669327323019@jenkins.jenkins>
Subject: [TCWG CI] Failure after v6.1-rc4-1107-g8cab76ec6349: bpf: Introduce
 single ownership BPF linked list API
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_35380_679115680.1669327322538"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_35380_679115680.1669327322538
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after v6.1-rc4-1107-g8cab76ec6349: bpf: Introduce single ownership BPF linked list API:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21442
# First few build errors in logs:
# 00:09:32 kernel/bpf/verifier.c:8340:19: error: array index 5 is past the end of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray-bounds]
# 00:09:32 kernel/bpf/verifier.c:8819:24: error: array index 5 is past the end of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray-bounds]
# 00:09:32 make[3]: *** [scripts/Makefile.build:250: kernel/bpf/verifier.o] Error 1
# 00:12:23 make[2]: *** [scripts/Makefile.build:500: kernel/bpf] Error 2
# 00:18:22 make[1]: *** [scripts/Makefile.build:500: kernel] Error 2
# 00:59:14 make: *** [Makefile:1992: .] Error 2

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21521
# linux build successful:
all

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-647 .
Status of v6.1-rc4-1107-g8cab76ec6349 commit for tcwg_kernel:
commit 8cab76ec634995e59a8b6346bf8b835ab7fad3a3
Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date:   Fri Nov 18 07:26:06 2022 +0530

    bpf: Introduce single ownership BPF linked list API
    
    Add a linked list API for use in BPF programs, where it expects
    protection from the bpf_spin_lock in the same allocation as the
    bpf_list_head. For now, only one bpf_spin_lock can be present hence that
    is assumed to be the one protecting the bpf_list_head.
    
    The following functions are added to kick things off:
    
    // Add node to beginning of list
    void bpf_list_push_front(struct bpf_list_head *head, struct bpf_list_node *node);
    
    // Add node to end of list
    void bpf_list_push_back(struct bpf_list_head *head, struct bpf_list_node *node);
    
    // Remove node at beginning of list and return it
    struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head);
    
    // Remove node at end of list and return it
    struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head);
    
    The lock protecting the bpf_list_head needs to be taken for all
    operations. The verifier ensures that the lock that needs to be taken is
    always held, and only the correct lock is taken for these operations.
    These checks are made statically by relying on the reg->id preserved for
    registers pointing into regions having both bpf_spin_lock and the
    objects protected by it. The comment over check_reg_allocation_locked in
    this change describes the logic in detail.
    
    Note that bpf_list_push_front and bpf_list_push_back are meant to
    consume the object containing the node in the 1st argument, however that
    specific mechanism is intended to not release the ref_obj_id directly
    until the bpf_spin_unlock is called. In this commit, nothing is done,
    but the next commit will be introducing logic to handle this case, so it
    has been left as is for now.
    
    bpf_list_pop_front and bpf_list_pop_back delete the first or last item
    of the list respectively, and return pointer to the element at the
    list_node offset. The user can then use container_of style macro to get
    the actual entry type. The verifier however statically knows the actual
    type, so the safety properties are still preserved.
    
    With these additions, programs can now manage their own linked lists and
    store their objects in them.
    
    Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
    Link: https://lore.kernel.org/r/20221118015614.2013203-17-memxor@gmail.com
    Signed-off-by: Alexei Starovoitov <ast@kernel.org>
* llvm-master-aarch64-next-allyesconfig
** Failure after v6.1-rc4-1107-g8cab76ec6349: bpf: Introduce single ownership BPF linked list API:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allyesconfig/699/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allyesconfig/699/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allyesconfig/698/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-8cab76ec634995e59a8b6346bf8b835ab7fad3a3
cd investigate-linux-8cab76ec634995e59a8b6346bf8b835ab7fad3a3

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allyesconfig/699/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allyesconfig/698/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit 8cab76ec634995e59a8b6346bf8b835ab7fad3a3
Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date:   Fri Nov 18 07:26:06 2022 +0530

    bpf: Introduce single ownership BPF linked list API
    
    Add a linked list API for use in BPF programs, where it expects
    protection from the bpf_spin_lock in the same allocation as the
    bpf_list_head. For now, only one bpf_spin_lock can be present hence that
    is assumed to be the one protecting the bpf_list_head.
    
    The following functions are added to kick things off:
    
    // Add node to beginning of list
    void bpf_list_push_front(struct bpf_list_head *head, struct bpf_list_node *node);
    
    // Add node to end of list
    void bpf_list_push_back(struct bpf_list_head *head, struct bpf_list_node *node);
    
    // Remove node at beginning of list and return it
    struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head);
    
    // Remove node at end of list and return it
    struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head);
    
    The lock protecting the bpf_list_head needs to be taken for all
    operations. The verifier ensures that the lock that needs to be taken is
    always held, and only the correct lock is taken for these operations.
    These checks are made statically by relying on the reg->id preserved for
    registers pointing into regions having both bpf_spin_lock and the
    objects protected by it. The comment over check_reg_allocation_locked in
    this change describes the logic in detail.
    
    Note that bpf_list_push_front and bpf_list_push_back are meant to
    consume the object containing the node in the 1st argument, however that
    specific mechanism is intended to not release the ref_obj_id directly
    until the bpf_spin_unlock is called. In this commit, nothing is done,
    but the next commit will be introducing logic to handle this case, so it
    has been left as is for now.
    
    bpf_list_pop_front and bpf_list_pop_back delete the first or last item
    of the list respectively, and return pointer to the element at the
    list_node offset. The user can then use container_of style macro to get
    the actual entry type. The verifier however statically knows the actual
    type, so the safety properties are still preserved.
    
    With these additions, programs can now manage their own linked lists and
    store their objects in them.
    
    Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
    Link: https://lore.kernel.org/r/20221118015614.2013203-17-memxor@gmail.com
    Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 kernel/bpf/helpers.c                           |  55 ++++-
 kernel/bpf/verifier.c                          | 275 ++++++++++++++++++++++++-
 tools/testing/selftests/bpf/bpf_experimental.h |  28 +++
 3 files changed, 349 insertions(+), 9 deletions(-)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 71d803ca0c1d..212e791d7452 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -1780,6 +1780,50 @@ void bpf_obj_drop_impl(void *p__alloc, void *meta__ign)
 	bpf_mem_free(&bpf_global_ma, p);
 }
 
+static void __bpf_list_add(struct bpf_list_node *node, struct bpf_list_head *head, bool tail)
+{
+	struct list_head *n = (void *)node, *h = (void *)head;
+
+	if (unlikely(!h->next))
+		INIT_LIST_HEAD(h);
+	if (unlikely(!n->next))
+		INIT_LIST_HEAD(n);
+	tail ? list_add_tail(n, h) : list_add(n, h);
+}
+
+void bpf_list_push_front(struct bpf_list_head *head, struct bpf_list_node *node)
+{
+	return __bpf_list_add(node, head, false);
+}
+
+void bpf_list_push_back(struct bpf_list_head *head, struct bpf_list_node *node)
+{
+	return __bpf_list_add(node, head, true);
+}
+
+static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head, bool tail)
+{
+	struct list_head *n, *h = (void *)head;
+
+	if (unlikely(!h->next))
+		INIT_LIST_HEAD(h);
+	if (list_empty(h))
+		return NULL;
+	n = tail ? h->prev : h->next;
+	list_del_init(n);
+	return (struct bpf_list_node *)n;
+}
+
+struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head)
+{
+	return __bpf_list_del(head, false);
+}
+
+struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head)
+{
+	return __bpf_list_del(head, true);
+}
+
 __diag_pop();
 
 BTF_SET8_START(generic_btf_ids)
@@ -1788,6 +1832,10 @@ BTF_ID_FLAGS(func, crash_kexec, KF_DESTRUCTIVE)
 #endif
 BTF_ID_FLAGS(func, bpf_obj_new_impl, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_obj_drop_impl, KF_RELEASE)
+BTF_ID_FLAGS(func, bpf_list_push_front)
+BTF_ID_FLAGS(func, bpf_list_push_back)
+BTF_ID_FLAGS(func, bpf_list_pop_front, KF_ACQUIRE | KF_RET_NULL)
+BTF_ID_FLAGS(func, bpf_list_pop_back, KF_ACQUIRE | KF_RET_NULL)
 BTF_SET8_END(generic_btf_ids)
 
 static const struct btf_kfunc_id_set generic_kfunc_set = {
@@ -1797,7 +1845,12 @@ static const struct btf_kfunc_id_set generic_kfunc_set = {
 
 static int __init kfunc_init(void)
 {
-	return register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACING, &generic_kfunc_set);
+	int ret;
+
+	ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACING, &generic_kfunc_set);
+	if (ret)
+		return ret;
+	return register_btf_kfunc_id_set(BPF_PROG_TYPE_SCHED_CLS, &generic_kfunc_set);
 }
 
 late_initcall(kfunc_init);
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index a339a39d895c..1364df74129e 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7883,6 +7883,9 @@ struct bpf_kfunc_call_arg_meta {
 		struct btf *btf;
 		u32 btf_id;
 	} arg_obj_drop;
+	struct {
+		struct btf_field *field;
+	} arg_list_head;
 };
 
 static bool is_kfunc_acquire(struct bpf_kfunc_call_arg_meta *meta)
@@ -7987,13 +7990,17 @@ static bool is_kfunc_arg_scalar_with_name(const struct btf *btf,
 
 enum {
 	KF_ARG_DYNPTR_ID,
+	KF_ARG_LIST_HEAD_ID,
+	KF_ARG_LIST_NODE_ID,
 };
 
 BTF_ID_LIST(kf_arg_btf_ids)
 BTF_ID(struct, bpf_dynptr_kern)
+BTF_ID(struct, bpf_list_head)
+BTF_ID(struct, bpf_list_node)
 
-static bool is_kfunc_arg_dynptr(const struct btf *btf,
-				const struct btf_param *arg)
+static bool __is_kfunc_ptr_arg_type(const struct btf *btf,
+				    const struct btf_param *arg, int type)
 {
 	const struct btf_type *t;
 	u32 res_id;
@@ -8006,7 +8013,22 @@ static bool is_kfunc_arg_dynptr(const struct btf *btf,
 	t = btf_type_skip_modifiers(btf, t->type, &res_id);
 	if (!t)
 		return false;
-	return btf_types_are_same(btf, res_id, btf_vmlinux, kf_arg_btf_ids[KF_ARG_DYNPTR_ID]);
+	return btf_types_are_same(btf, res_id, btf_vmlinux, kf_arg_btf_ids[type]);
+}
+
+static bool is_kfunc_arg_dynptr(const struct btf *btf, const struct btf_param *arg)
+{
+	return __is_kfunc_ptr_arg_type(btf, arg, KF_ARG_DYNPTR_ID);
+}
+
+static bool is_kfunc_arg_list_head(const struct btf *btf, const struct btf_param *arg)
+{
+	return __is_kfunc_ptr_arg_type(btf, arg, KF_ARG_LIST_HEAD_ID);
+}
+
+static bool is_kfunc_arg_list_node(const struct btf *btf, const struct btf_param *arg)
+{
+	return __is_kfunc_ptr_arg_type(btf, arg, KF_ARG_LIST_NODE_ID);
 }
 
 /* Returns true if struct is composed of scalars, 4 levels of nesting allowed */
@@ -8063,6 +8085,8 @@ enum kfunc_ptr_arg_type {
 	KF_ARG_PTR_TO_ALLOC_BTF_ID,  /* Allocated object */
 	KF_ARG_PTR_TO_KPTR,	     /* PTR_TO_KPTR but type specific */
 	KF_ARG_PTR_TO_DYNPTR,
+	KF_ARG_PTR_TO_LIST_HEAD,
+	KF_ARG_PTR_TO_LIST_NODE,
 	KF_ARG_PTR_TO_BTF_ID,	     /* Also covers reg2btf_ids conversions */
 	KF_ARG_PTR_TO_MEM,
 	KF_ARG_PTR_TO_MEM_SIZE,	     /* Size derived from next argument, skip it */
@@ -8071,16 +8095,28 @@ enum kfunc_ptr_arg_type {
 enum special_kfunc_type {
 	KF_bpf_obj_new_impl,
 	KF_bpf_obj_drop_impl,
+	KF_bpf_list_push_front,
+	KF_bpf_list_push_back,
+	KF_bpf_list_pop_front,
+	KF_bpf_list_pop_back,
 };
 
 BTF_SET_START(special_kfunc_set)
 BTF_ID(func, bpf_obj_new_impl)
 BTF_ID(func, bpf_obj_drop_impl)
+BTF_ID(func, bpf_list_push_front)
+BTF_ID(func, bpf_list_push_back)
+BTF_ID(func, bpf_list_pop_front)
+BTF_ID(func, bpf_list_pop_back)
 BTF_SET_END(special_kfunc_set)
 
 BTF_ID_LIST(special_kfunc_list)
 BTF_ID(func, bpf_obj_new_impl)
 BTF_ID(func, bpf_obj_drop_impl)
+BTF_ID(func, bpf_list_push_front)
+BTF_ID(func, bpf_list_push_back)
+BTF_ID(func, bpf_list_pop_front)
+BTF_ID(func, bpf_list_pop_back)
 
 static enum kfunc_ptr_arg_type
 get_kfunc_ptr_arg_type(struct bpf_verifier_env *env,
@@ -8123,6 +8159,12 @@ get_kfunc_ptr_arg_type(struct bpf_verifier_env *env,
 	if (is_kfunc_arg_dynptr(meta->btf, &args[argno]))
 		return KF_ARG_PTR_TO_DYNPTR;
 
+	if (is_kfunc_arg_list_head(meta->btf, &args[argno]))
+		return KF_ARG_PTR_TO_LIST_HEAD;
+
+	if (is_kfunc_arg_list_node(meta->btf, &args[argno]))
+		return KF_ARG_PTR_TO_LIST_NODE;
+
 	if ((base_type(reg->type) == PTR_TO_BTF_ID || reg2btf_ids[base_type(reg->type)])) {
 		if (!btf_type_is_struct(ref_t)) {
 			verbose(env, "kernel function %s args#%d pointer type %s %s is not supported\n",
@@ -8218,6 +8260,182 @@ static int process_kf_arg_ptr_to_kptr(struct bpf_verifier_env *env,
 	return 0;
 }
 
+/* Implementation details:
+ *
+ * Each register points to some region of memory, which we define as an
+ * allocation. Each allocation may embed a bpf_spin_lock which protects any
+ * special BPF objects (bpf_list_head, bpf_rb_root, etc.) part of the same
+ * allocation. The lock and the data it protects are colocated in the same
+ * memory region.
+ *
+ * Hence, everytime a register holds a pointer value pointing to such
+ * allocation, the verifier preserves a unique reg->id for it.
+ *
+ * The verifier remembers the lock 'ptr' and the lock 'id' whenever
+ * bpf_spin_lock is called.
+ *
+ * To enable this, lock state in the verifier captures two values:
+ *	active_lock.ptr = Register's type specific pointer
+ *	active_lock.id  = A unique ID for each register pointer value
+ *
+ * Currently, PTR_TO_MAP_VALUE and PTR_TO_BTF_ID | MEM_ALLOC are the two
+ * supported register types.
+ *
+ * The active_lock.ptr in case of map values is the reg->map_ptr, and in case of
+ * allocated objects is the reg->btf pointer.
+ *
+ * The active_lock.id is non-unique for maps supporting direct_value_addr, as we
+ * can establish the provenance of the map value statically for each distinct
+ * lookup into such maps. They always contain a single map value hence unique
+ * IDs for each pseudo load pessimizes the algorithm and rejects valid programs.
+ *
+ * So, in case of global variables, they use array maps with max_entries = 1,
+ * hence their active_lock.ptr becomes map_ptr and id = 0 (since they all point
+ * into the same map value as max_entries is 1, as described above).
+ *
+ * In case of inner map lookups, the inner map pointer has same map_ptr as the
+ * outer map pointer (in verifier context), but each lookup into an inner map
+ * assigns a fresh reg->id to the lookup, so while lookups into distinct inner
+ * maps from the same outer map share the same map_ptr as active_lock.ptr, they
+ * will get different reg->id assigned to each lookup, hence different
+ * active_lock.id.
+ *
+ * In case of allocated objects, active_lock.ptr is the reg->btf, and the
+ * reg->id is a unique ID preserved after the NULL pointer check on the pointer
+ * returned from bpf_obj_new. Each allocation receives a new reg->id.
+ */
+static int check_reg_allocation_locked(struct bpf_verifier_env *env, struct bpf_reg_state *reg)
+{
+	void *ptr;
+	u32 id;
+
+	switch ((int)reg->type) {
+	case PTR_TO_MAP_VALUE:
+		ptr = reg->map_ptr;
+		break;
+	case PTR_TO_BTF_ID | MEM_ALLOC:
+		ptr = reg->btf;
+		break;
+	default:
+		verbose(env, "verifier internal error: unknown reg type for lock check\n");
+		return -EFAULT;
+	}
+	id = reg->id;
+
+	if (!env->cur_state->active_lock.ptr)
+		return -EINVAL;
+	if (env->cur_state->active_lock.ptr != ptr ||
+	    env->cur_state->active_lock.id != id) {
+		verbose(env, "held lock and object are not in the same allocation\n");
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static bool is_bpf_list_api_kfunc(u32 btf_id)
+{
+	return btf_id == special_kfunc_list[KF_bpf_list_push_front] ||
+	       btf_id == special_kfunc_list[KF_bpf_list_push_back] ||
+	       btf_id == special_kfunc_list[KF_bpf_list_pop_front] ||
+	       btf_id == special_kfunc_list[KF_bpf_list_pop_back];
+}
+
+static int process_kf_arg_ptr_to_list_head(struct bpf_verifier_env *env,
+					   struct bpf_reg_state *reg, u32 regno,
+					   struct bpf_kfunc_call_arg_meta *meta)
+{
+	struct btf_field *field;
+	struct btf_record *rec;
+	u32 list_head_off;
+
+	if (meta->btf != btf_vmlinux || !is_bpf_list_api_kfunc(meta->func_id)) {
+		verbose(env, "verifier internal error: bpf_list_head argument for unknown kfunc\n");
+		return -EFAULT;
+	}
+
+	if (!tnum_is_const(reg->var_off)) {
+		verbose(env,
+			"R%d doesn't have constant offset. bpf_list_head has to be at the constant offset\n",
+			regno);
+		return -EINVAL;
+	}
+
+	rec = reg_btf_record(reg);
+	list_head_off = reg->off + reg->var_off.value;
+	field = btf_record_find(rec, list_head_off, BPF_LIST_HEAD);
+	if (!field) {
+		verbose(env, "bpf_list_head not found at offset=%u\n", list_head_off);
+		return -EINVAL;
+	}
+
+	/* All functions require bpf_list_head to be protected using a bpf_spin_lock */
+	if (check_reg_allocation_locked(env, reg)) {
+		verbose(env, "bpf_spin_lock at off=%d must be held for bpf_list_head\n",
+			rec->spin_lock_off);
+		return -EINVAL;
+	}
+
+	if (meta->arg_list_head.field) {
+		verbose(env, "verifier internal error: repeating bpf_list_head arg\n");
+		return -EFAULT;
+	}
+	meta->arg_list_head.field = field;
+	return 0;
+}
+
+static int process_kf_arg_ptr_to_list_node(struct bpf_verifier_env *env,
+					   struct bpf_reg_state *reg, u32 regno,
+					   struct bpf_kfunc_call_arg_meta *meta)
+{
+	const struct btf_type *et, *t;
+	struct btf_field *field;
+	struct btf_record *rec;
+	u32 list_node_off;
+
+	if (meta->btf != btf_vmlinux ||
+	    (meta->func_id != special_kfunc_list[KF_bpf_list_push_front] &&
+	     meta->func_id != special_kfunc_list[KF_bpf_list_push_back])) {
+		verbose(env, "verifier internal error: bpf_list_node argument for unknown kfunc\n");
+		return -EFAULT;
+	}
+
+	if (!tnum_is_const(reg->var_off)) {
+		verbose(env,
+			"R%d doesn't have constant offset. bpf_list_node has to be at the constant offset\n",
+			regno);
+		return -EINVAL;
+	}
+
+	rec = reg_btf_record(reg);
+	list_node_off = reg->off + reg->var_off.value;
+	field = btf_record_find(rec, list_node_off, BPF_LIST_NODE);
+	if (!field || field->offset != list_node_off) {
+		verbose(env, "bpf_list_node not found at offset=%u\n", list_node_off);
+		return -EINVAL;
+	}
+
+	field = meta->arg_list_head.field;
+
+	et = btf_type_by_id(field->list_head.btf, field->list_head.value_btf_id);
+	t = btf_type_by_id(reg->btf, reg->btf_id);
+	if (!btf_struct_ids_match(&env->log, reg->btf, reg->btf_id, 0, field->list_head.btf,
+				  field->list_head.value_btf_id, true)) {
+		verbose(env, "operation on bpf_list_head expects arg#1 bpf_list_node at offset=%d "
+			"in struct %s, but arg is at offset=%d in struct %s\n",
+			field->list_head.node_offset, btf_name_by_offset(field->list_head.btf, et->name_off),
+			list_node_off, btf_name_by_offset(reg->btf, t->name_off));
+		return -EINVAL;
+	}
+
+	if (list_node_off != field->list_head.node_offset) {
+		verbose(env, "arg#1 offset=%d, but expected bpf_list_node at offset=%d in struct %s\n",
+			list_node_off, field->list_head.node_offset,
+			btf_name_by_offset(field->list_head.btf, et->name_off));
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int check_kfunc_args(struct bpf_verifier_env *env, struct bpf_kfunc_call_arg_meta *meta)
 {
 	const char *func_name = meta->func_name, *ref_tname;
@@ -8336,6 +8554,8 @@ static int check_kfunc_args(struct bpf_verifier_env *env, struct bpf_kfunc_call_
 			break;
 		case KF_ARG_PTR_TO_KPTR:
 		case KF_ARG_PTR_TO_DYNPTR:
+		case KF_ARG_PTR_TO_LIST_HEAD:
+		case KF_ARG_PTR_TO_LIST_NODE:
 		case KF_ARG_PTR_TO_MEM:
 		case KF_ARG_PTR_TO_MEM_SIZE:
 			/* Trusted by default */
@@ -8400,6 +8620,33 @@ static int check_kfunc_args(struct bpf_verifier_env *env, struct bpf_kfunc_call_
 				return -EINVAL;
 			}
 			break;
+		case KF_ARG_PTR_TO_LIST_HEAD:
+			if (reg->type != PTR_TO_MAP_VALUE &&
+			    reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
+				verbose(env, "arg#%d expected pointer to map value or allocated object\n", i);
+				return -EINVAL;
+			}
+			if (reg->type == (PTR_TO_BTF_ID | MEM_ALLOC) && !reg->ref_obj_id) {
+				verbose(env, "allocated object must be referenced\n");
+				return -EINVAL;
+			}
+			ret = process_kf_arg_ptr_to_list_head(env, reg, regno, meta);
+			if (ret < 0)
+				return ret;
+			break;
+		case KF_ARG_PTR_TO_LIST_NODE:
+			if (reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
+				verbose(env, "arg#%d expected pointer to allocated object\n", i);
+				return -EINVAL;
+			}
+			if (!reg->ref_obj_id) {
+				verbose(env, "allocated object must be referenced\n");
+				return -EINVAL;
+			}
+			ret = process_kf_arg_ptr_to_list_node(env, reg, regno, meta);
+			if (ret < 0)
+				return ret;
+			break;
 		case KF_ARG_PTR_TO_BTF_ID:
 			/* Only base_type is checked, further checks are done here */
 			if (reg->type != PTR_TO_BTF_ID &&
@@ -8568,6 +8815,15 @@ static int check_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
 				env->insn_aux_data[insn_idx].kptr_struct_meta =
 					btf_find_struct_meta(meta.arg_obj_drop.btf,
 							     meta.arg_obj_drop.btf_id);
+			} else if (meta.func_id == special_kfunc_list[KF_bpf_list_pop_front] ||
+				   meta.func_id == special_kfunc_list[KF_bpf_list_pop_back]) {
+				struct btf_field *field = meta.arg_list_head.field;
+
+				mark_reg_known_zero(env, regs, BPF_REG_0);
+				regs[BPF_REG_0].type = PTR_TO_BTF_ID | MEM_ALLOC;
+				regs[BPF_REG_0].btf = field->list_head.btf;
+				regs[BPF_REG_0].btf_id = field->list_head.value_btf_id;
+				regs[BPF_REG_0].off = field->list_head.node_offset;
 			} else {
 				verbose(env, "kernel function %s unhandled dynamic return type\n",
 					meta.func_name);
@@ -13264,11 +13520,14 @@ static int do_check(struct bpf_verifier_env *env)
 					return -EINVAL;
 				}
 
-				if (env->cur_state->active_lock.ptr &&
-				    (insn->src_reg == BPF_PSEUDO_CALL ||
-				     insn->imm != BPF_FUNC_spin_unlock)) {
-					verbose(env, "function calls are not allowed while holding a lock\n");
-					return -EINVAL;
+				if (env->cur_state->active_lock.ptr) {
+					if ((insn->src_reg == BPF_REG_0 && insn->imm != BPF_FUNC_spin_unlock) ||
+					    (insn->src_reg == BPF_PSEUDO_CALL) ||
+					    (insn->src_reg == BPF_PSEUDO_KFUNC_CALL &&
+					     (insn->off != 0 || !is_bpf_list_api_kfunc(insn->imm)))) {
+						verbose(env, "function calls are not allowed while holding a lock\n");
+						return -EINVAL;
+					}
 				}
 				if (insn->src_reg == BPF_PSEUDO_CALL)
 					err = check_func_call(env, insn, &env->insn_idx);
diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index 8473395a11af..d6b143275e82 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -35,4 +35,32 @@ extern void bpf_obj_drop_impl(void *kptr, void *meta) __ksym;
 /* Convenience macro to wrap over bpf_obj_drop_impl */
 #define bpf_obj_drop(kptr) bpf_obj_drop_impl(kptr, NULL)
 
+/* Description
+ *	Add a new entry to the beginning of the BPF linked list.
+ * Returns
+ *	Void.
+ */
+extern void bpf_list_push_front(struct bpf_list_head *head, struct bpf_list_node *node) __ksym;
+
+/* Description
+ *	Add a new entry to the end of the BPF linked list.
+ * Returns
+ *	Void.
+ */
+extern void bpf_list_push_back(struct bpf_list_head *head, struct bpf_list_node *node) __ksym;
+
+/* Description
+ *	Remove the entry at the beginning of the BPF linked list.
+ * Returns
+ *	Pointer to bpf_list_node of deleted entry, or NULL if list is empty.
+ */
+extern struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head) __ksym;
+
+/* Description
+ *	Remove the entry at the end of the BPF linked list.
+ * Returns
+ *	Pointer to bpf_list_node of deleted entry, or NULL if list is empty.
+ */
+extern struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head) __ksym;
+
 #endif
</cut>
------=_Part_35380_679115680.1669327322538--
