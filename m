Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6536F134AD
	for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 15:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692113476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kfI+luU6AWmFTwvFpwUVre98jSLW/3cZi/beg0VfzP8=;
	b=e4DXeUJWsG44RFCBIccKXl5EJgJ+aLX9bVgOmjvs9uqFBUvIyS/M7E3AVxLxQfHXD91nVT
	RwYAuh/56jMFn91ZUg1Xxzd8Re0GE4DLq7fdp7UXfJQh6LgBp88ALhF2w+6kUYImoAF0Do
	nTAX5XrQyeyyUfQ18LzjK5MJnvhYuPQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-otFaPPlPO_i0hL73xgiAZA-1; Tue, 15 Aug 2023 11:31:14 -0400
X-MC-Unique: otFaPPlPO_i0hL73xgiAZA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36E2780556B
	for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 15:31:14 +0000 (UTC)
Received: from [172.64.9.53] (unknown [10.30.34.184])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F9462166B2D;
	Tue, 15 Aug 2023 15:31:14 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (SKIPPED 16 of 267): Test report for master
 (6.5.0-rc6, mainline.kernel.org-clang, 91aa6c41)
Date: Tue, 15 Aug 2023 15:31:14 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Message-Id: <34770.123081511311400914@us-mta-414.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'for_linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/mst/vhost

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/100030

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: kdump - kexec_boot: image_arm64_probe: Bad arm64 image heade=
r
            URL: https://issues.redhat.com/browse/RHELPLAN-138156
            Affected tests:
                 aarch64 - kdump - kexec_boot
                 aarch64 - kdump - kexec-file-load
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
        Issue: WARNING: CPU: 0 PID: 0 at arch/x86/kernel/alternative.c:558 =
apply_returns+0x1bf/0x210
            URL: https://lore.kernel.org/all/Ys58BxHxoDZ7rfpr@xsang-OptiPle=
x-9020/
            Affected tests:
                  x86_64 - Boot test
                  x86_64 - Reboot test
                  x86_64 (debug) - Boot test
                  x86_64 (debug) - Reboot test
        Issue: kselftests upstream - net: FAIL: Ping received ICMP Packet t=
oo big
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1571
            Affected tests:
                  x86_64 (debug) - kselftests upstream - net
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: [upstream] Libkcapi AF_ALG test: Oops in gcm_walk_start/gcm_=
aes_crypt on s390x
            URL: https://linux-regtracking.leemhuis.info/regzbot/regression=
/lore/CAAUqJDuRkHE8fPgZJGaKjUjd3QfGwzfumuJBmStPqBhubxyk_A@mail.gmail.com/
            Affected tests:
                   s390x - Libkcapi AF_ALG test
        Issue: Storage - lvm thinp sanity: FAIL: mkfs.xfs -fd noalign /dev/=
mapper/myvg-thinvolume1
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1353
            Affected tests:
                 ppc64le - Storage - lvm thinp sanity
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite



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

