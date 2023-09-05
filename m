Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7848633
	for <llvm@lists.linux.dev>; Tue,  5 Sep 2023 02:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693881677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HC3YvdmN3ib1mV+wmHBUh1bVl14WZpaYH7mbR7c8XtU=;
	b=Ygb3mT5G6Aekqomg9lS8og2goZqEEDs9b2S7amegKwVYfrVE4QtquJv8xskXojjK5EyiP3
	eSgvCMHuGPA3uTF0LRiuJwww3zoHiKNzADLeoiqi1Nb9F3K0+xX6mqRW4bF05IRBSzsUJS
	zXaRV8FKuyOSKPUclyTB5M3ECe4YF1I=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-Wv8-n4_UN-6EusPczHPs7Q-1; Mon, 04 Sep 2023 22:41:16 -0400
X-MC-Unique: Wv8-n4_UN-6EusPczHPs7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BD4E3C0D869
	for <llvm@lists.linux.dev>; Tue,  5 Sep 2023 02:41:16 +0000 (UTC)
Received: from [172.64.4.20] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ECFC62026D4B;
	Tue,  5 Sep 2023 02:41:15 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (SKIPPED 5 of 234): Test report for master
 (6.5.0, mainline.kernel.org-clang, 7a1415ee)
Date: Tue, 05 Sep 2023 02:41:15 -0000
To: llvm@lists.linux.dev, zlang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Message-Id: <49277.123090422411600134@us-mta-613.us.mimecast.lan>
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
    Commit message: Merge tag 'm68knommu-for-v6.6' of git://git.kernel.org/=
pub/scm/linux/kernel/git/gerg/m68knommu

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/102897

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - POSIX pjd-fstest suites
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9385870
                   Non-passing subtests:
                       =E2=9D=8C FAIL /01_dmesg_check

    We also see the following known issues which are not related to your ch=
anges:
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
                  x86_64 - Reboot test
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
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
                  x86_64 (debug) - xfstests - nfsv4.2
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

