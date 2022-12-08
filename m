Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75802A21
	for <llvm@lists.linux.dev>; Thu,  8 Dec 2022 11:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670499699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VcbPY/0GxeGeeazLdpN6yTCbeocT5Wdpz0O0a9LMrO0=;
	b=SaPyalV+lx5Ogw2UYOKeaJSAUdC6q2VHKpFlaArulCT5rgyMJYBdypoeaMOAAG6nT6NZZu
	0Zp0UmKzTk4fNkgaXJBbvRuIIH82RzTHGCLoI/hyZ8DL4EposH0MJ6mE6fVfU3gPOjZnCC
	2N6UWoy6+7TzlqulhC9SiErEAZ77tvw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-_yx2UyeWMSqoY_SC5Lakcg-1; Thu, 08 Dec 2022 06:41:37 -0500
X-MC-Unique: _yx2UyeWMSqoY_SC5Lakcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A02423803910
	for <llvm@lists.linux.dev>; Thu,  8 Dec 2022 11:41:37 +0000 (UTC)
Received: from [172.64.11.46] (unknown [10.30.32.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C7D71415100;
	Thu,  8 Dec 2022 11:41:37 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (82/379 SKIPPED): Test report for master
 (6.1.0-rc8, mainline.kernel.org-clang, 479174d4)
Date: Thu, 08 Dec 2022 11:41:37 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Message-Id: <64850.122120806413700587@us-mta-270.us.mimecast.lan>
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
    Commit message: Merge tag 'platform-drivers-x86-v6.1-5' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/62526

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: gcc: error: unrecognized command-line option =E2=80=98-Qunus=
ed-arguments=E2=80=99
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/513
            Affected tests:
                  x86_64 (debug) - kselftest build - bpf
        Issue: Networking socket: fuzz: ./service.sh: line 74: [: %rhel: in=
teger expression expected
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1455
            Affected tests:
                  x86_64 (debug) - Networking socket: fuzz
        Issue: Networking socket: fuzz: hit test timeout
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1449
            Affected tests:
                  x86_64 (debug) - Networking socket: fuzz
        Issue: [rawhide] avc:  denied  { setpcap } for  pid=3D651 comm=3D"r=
syslogd" capability=3D8  scontext=3Dsystem_u:system_r:syslogd_t:s0 tcontext=
=3Dsystem_u:system_r:syslogd_t:s0 tclass=3Dcapability permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2149633
            Affected tests:
                 ppc64le - Reboot test
                   s390x - Reboot test
                  x86_64 - Reboot test
                  x86_64 (debug) - Networking sctp-auth: sockopts test
                  x86_64 (debug) - Reboot test
        Issue: avc:  denied  { sys_admin } for  pid=3D674004 comm=3D"system=
d-gpt-aut" capability=3D21  scontext=3Dsystem_u:system_r:systemd_gpt_genera=
tor_t:s0 tcontext=3Dsystem_u:system_r:systemd_gpt_generator_t:s0 tclass=3Dc=
apability permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2083900
            Affected tests:
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
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: (upstream) Cannot download, all mirrors were already tried w=
ithout success
            URL: https://datawarehouse.cki-project.org/kcidb/tests/5439024
            Affected tests:
                  x86_64 (debug) - xfstests - ext4
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: Storage blktests - blk: scsi/007: Reading from scsi_debug fa=
iled
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2027550
            Affected tests:
                  x86_64 - Storage - blktests - blk
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                  x86_64 - Storage - block - storage fio numa
        Issue: Networking MACsec: sanity: Cannot find device "dummy0"
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1306
            Affected tests:
                 ppc64le - Networking MACsec: sanity
                  x86_64 - Networking MACsec: sanity
        Issue: Networking route: pmtu: Cannot find device "veth0_client"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2118519
            Affected tests:
                 ppc64le - Networking MACsec: sanity
                  x86_64 - Networking MACsec: sanity
        Issue: stress: stress-ng - memory: stress-ng --memrate TIMEOUT
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1172
            Affected tests:
                   s390x - stress: stress-ng - memory
        Issue: stress: stress-ng - memory: system hit OOM
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1425
            Affected tests:
                   s390x - stress: stress-ng - memory
        Issue: stress: stress-ng - memory: (panic) Comm: systemd-oomd Not t=
ainted 6.1.0-rc3
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1461
            Affected tests:
                   s390x - stress: stress-ng - memory
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: [upstream] [aarch64] Boot Test: Error: kernel image argument=
 /boot/vmlinuz-6.1.0-rc8 not a file
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1497
            Affected tests:
                 aarch64 - Boot test



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

