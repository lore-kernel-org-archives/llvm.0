Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C962B1CF8D
	for <llvm@lists.linux.dev>; Mon, 16 Oct 2023 10:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fjv79Lx1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697450483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0uLot5rb0FgYOsaz3NC8KUM9Rbi522eph4rbKckOKvw=;
	b=fjv79Lx1S1O5VVjXoFhz7ruzKKdafKiKFaLeiBxvMv5J110opGuU9HvaVhTTRIy68v6ie8
	31qrUs4h9nwSdVeNbYTSvmrhjXVVZgaczFeeDOYS4Y7sOK8wBEb/SEJsLnWqPkJk/e5UJ2
	McVXNGMT21SAsUr5PR/kS/amtUsA12Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-uQONwAjkOpuXaGglpO18VA-1; Mon, 16 Oct 2023 06:01:22 -0400
X-MC-Unique: uQONwAjkOpuXaGglpO18VA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C649681D9E9
	for <llvm@lists.linux.dev>; Mon, 16 Oct 2023 10:01:21 +0000 (UTC)
Received: from [172.64.13.10] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AAF6D25C8;
	Mon, 16 Oct 2023 10:01:21 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 11 of 230): Test report for master
 (6.6.0-rc5, mainline.kernel.org-clang, fbe1bf1e)
Date: Mon, 16 Oct 2023 10:01:21 -0000
To: bgoncalv@redhat.com, mhoyer@redhat.com, jbastian@redhat.com,
 llvm@lists.linux.dev, xzhou@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Message-Id: <96114.123101606012200243@us-mta-542.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Revert "x86/smp: Put CPUs into INIT on shutdown if poss=
ible"

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/109213

One or more kernel tests failed:
    Unrecognized or new issues:
           s390x - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9907786
                   Non-passing subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9907741
                   Non-passing subtests:
                       =E2=9D=8C FAIL Panic
          x86_64 (debug) - Storage - iSCSI parameters
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9907760
          x86_64 (debug) - xfstests - ext4
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9907769
                   Non-passing subtests:
                       =E2=9D=8C FAIL generic/014
                       =E2=9D=8C FAIL /01_dmesg_check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: stress: stress-ng - memory: stress-ng invoked oom-killer: gf=
p_mask=3D0x140dca(GFP_HIGHUSER_MOVABLE|__GFP_COMP|__GFP_ZERO), order=3D0, o=
om_score_adj=3D1000
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1214
            Affected tests:
                  x86_64 - stress: stress-ng - memory
        Issue: stress: stress-ng - memory: system hit OOM
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1425
            Affected tests:
                  x86_64 - stress: stress-ng - memory
        Issue: xfstests: generic/354 file exists
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1654
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: stress: stress-ng - memory: abort due to system crash or reb=
oot
            URL: https://datawarehouse.cki-project.org/kcidb/tests/6821894
            Affected tests:
                 aarch64 - stress: stress-ng - memory
        Issue: kdump - kexec_boot: image_arm64_probe: Bad arm64 image heade=
r
            URL: https://issues.redhat.com/browse/RHELPLAN-138156
            Affected tests:
                 aarch64 - kdump - kexec_boot
        Issue: [RHEL9][aarch64] kdump - kexec_load(): can't determine the f=
ile type of kdump kernel
            URL: https://issues.redhat.com/browse/RHEL-9434
            Affected tests:
                 aarch64 - kdump - kexec_boot
                 aarch64 - kdump - sysrq-c
        Issue: [rawhide] kdump - sysrq-c: kdump: kexec: failed to load kdum=
p kernel
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2052949#c1
            Affected tests:
                 aarch64 - kdump - sysrq-c
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs



If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

