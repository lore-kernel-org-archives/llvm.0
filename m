Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E219E258F
	for <llvm@lists.linux.dev>; Sat,  2 Sep 2023 23:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693698086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sNTRtVJvXfwOqjIAA2qzah2jt2lheo9dGjrY9u4ZVL8=;
	b=WP0lpk6OyrKbUCld2ghKhIMbnrvSAU/+Uu+qbPAD8grlLmZ1d0B9lgO1LYBspo+evKV3sW
	JQkPjfa3NbpzGzCbgDTpGG5VOMYMpaN/RnK8+gpyeLruh+pTFPrrJwgaa2XOPGMniuDyU/
	STdTfwv3xDfn7LMpHzFxtX7Kk3nb0HI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-VjjVnDJANx6eA0Vtq0OCDg-1; Sat, 02 Sep 2023 19:41:23 -0400
X-MC-Unique: VjjVnDJANx6eA0Vtq0OCDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01D4B800193
	for <llvm@lists.linux.dev>; Sat,  2 Sep 2023 23:41:23 +0000 (UTC)
Received: from [172.64.14.60] (unknown [10.30.33.250])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEC971460FFA;
	Sat,  2 Sep 2023 23:41:22 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (SKIPPED 10 of 234): Test report for master
 (6.5.0, mainline.kernel.org-clang, 76be05d4)
Date: Sat, 02 Sep 2023 23:41:22 -0000
To: llvm@lists.linux.dev, zlang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Message-Id: <84638.123090219412300191@us-mta-191.us.mimecast.lan>
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
    Commit message: cgroup: fix build when CGROUP_SCHED is not enabled

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/102787

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - POSIX pjd-fstest suites
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9375749
                   Non-passing subtests:
                       =E2=9D=8C FAIL /01_dmesg_check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: kdump - kexec_boot: image_arm64_probe: Bad arm64 image heade=
r
            URL: https://issues.redhat.com/browse/RHELPLAN-138156
            Affected tests:
                 aarch64 - kdump - kexec_boot
        Issue: [upstream] avc:  denied  { write } for  pid=3D1274 comm=3D"k=
exec" path=3D2F6D656D66643A6B65726E656C202864656C6574656429 dev=3D"tmpfs" i=
no=3D2048 scontext=3Dsystem_u:system_r:kdump_t:s0 tcontext=3Dsystem_u:objec=
t_r:tmpfs_t:s0 tclass=3Dfile permissive=3D1
            URL: https://github.com/fedora-selinux/selinux-policy/pull/1860
            Affected tests:
                 aarch64 - Reboot test
                 ppc64le - Reboot test
                   s390x - Reboot test
                  x86_64 - Reboot test
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite



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

