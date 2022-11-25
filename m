Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C735CA4
	for <llvm@lists.linux.dev>; Fri, 25 Nov 2022 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669392696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T3W+LLdVT7CI8gkcTmQs1CmQKwXzaa4wRVu4rxvSo+g=;
	b=gEWj7B6Trm1vskP8f38daiOo1/LlDqxHKdfPNQjfOIqpG4NeyUndXWg4z8myUEXwj7gHdI
	HOom2AdEn8mjQ0Rhs1b5egZ66cCFf/tBs3IQfgtvHtk2f31PZZCieI0egR/re1RrGtRUg7
	69J3/xiytDU15fX2GM46P+DRX1lY7T4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-52hXWvHbM16ql8_HAMT_xA-1; Fri, 25 Nov 2022 11:11:35 -0500
X-MC-Unique: 52hXWvHbM16ql8_HAMT_xA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53EFB185A78B
	for <llvm@lists.linux.dev>; Fri, 25 Nov 2022 16:11:35 +0000 (UTC)
Received: from [172.64.4.10] (unknown [10.30.34.148])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3FBCC15BA4;
	Fri, 25 Nov 2022 16:11:34 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.1.0-rc6,
 mainline.kernel.org-clang, 08ad43d5)
Date: Fri, 25 Nov 2022 16:11:34 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Message-Id: <47411.122112511113500317@us-mta-330.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: OK


Kernel information:
    Commit message: Merge tag 'net-6.1-rc7' of git://git.kernel.org/pub/scm=
/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/61065

One or more kernel tests failed:
    =E2=9D=97 Regression(s) detected:
           s390x - stress: stress-ng - memory
                   Issue: stress: stress-ng - memory: stress-ng --memrate T=
IMEOUT
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1172
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6102245

    We also see the following known issues which are not related to your ch=
anges:
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftest build - bpf
        Issue: Networking socket: fuzz: hit test timeout
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1449
            Affected tests:
                  x86_64 (debug) - Networking socket: fuzz
        Issue: Networking socket: fuzz: ./service.sh: line 74: [: %rhel: in=
teger expression expected
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1455
            Affected tests:
                  x86_64 (debug) - Networking socket: fuzz
        Issue: avc:  denied  { sys_admin } for  pid=3D674004 comm=3D"system=
d-gpt-aut" capability=3D21  scontext=3Dsystem_u:system_r:systemd_gpt_genera=
tor_t:s0 tcontext=3Dsystem_u:system_r:systemd_gpt_generator_t:s0 tclass=3Dc=
apability permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2083900
            Affected tests:
                 aarch64 - Networking MACsec: sanity
                 aarch64 - Networking cki netfilter test
                 aarch64 - ALSA PCM loopback test
                 aarch64 - Storage - SCSI VPD
                 ppc64le - Networking MACsec: sanity
                 ppc64le - Networking cki netfilter test
                 ppc64le - ALSA PCM loopback test
                  x86_64 - Networking MACsec: sanity
                  x86_64 - Networking cki netfilter test
                  x86_64 - ALSA PCM loopback test
                  x86_64 - Storage - SCSI VPD
                  x86_64 (debug) - Networking cki netfilter test
                  x86_64 (debug) - Storage - SCSI VPD
        Issue: kselftests upstream - net: FAIL: tls.13_sm4_gcm.sendfile
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1479
            Affected tests:
                  x86_64 (debug) - kselftests upstream - net
        Issue: kselftests upstream: WARN: kselftests/tc-testing test not fo=
und in kselftest-list.txt
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1473
            Affected tests:
                  x86_64 (debug) - kselftests upstream - forwarding
                  x86_64 (debug) - kselftests upstream - tc
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: Storage blktests - blk: scsi/007: Reading from scsi_debug fa=
iled
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2027550
            Affected tests:
                  x86_64 - Storage - blktests - blk
        Issue: Networking MACsec: sanity: Cannot find device "dummy0"
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1306
            Affected tests:
                 aarch64 - Networking MACsec: sanity
                 ppc64le - Networking MACsec: sanity
                  x86_64 - Networking MACsec: sanity
        Issue: Networking route: pmtu: Cannot find device "veth0_client"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2118519
            Affected tests:
                 aarch64 - Networking MACsec: sanity
                 ppc64le - Networking MACsec: sanity
                  x86_64 - Networking MACsec: sanity
        Issue: kdump - sysrq-c: ERROR: No vmcore-dmesg.txt saved in /var/cr=
ash
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1339
            Affected tests:
                 aarch64 - kdump - sysrq-c
                 ppc64le - kdump - sysrq-c
                 ppc64le - kdump - file-load
                   s390x - kdump - sysrq-c
                   s390x - kdump - file-load
                  x86_64 - kdump - sysrq-c
                  x86_64 - kdump - file-load
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: gcc: error: unrecognized command-line option =E2=80=98-Qunus=
ed-arguments=E2=80=99
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/513
            Affected tests:
                 aarch64 - Firmware test suite
        Issue: Firmware test suite: modinfo: ERROR: Module efi_runtime not =
found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1235
            Affected tests:
                 aarch64 - Firmware test suite
        Issue: xfstests - _check_xfs_filesystem: filesystem on /dev/nvme0n1=
p4 is inconsistent (r)
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1989409
            Affected tests:
                 aarch64 - xfstests - btrfs



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

