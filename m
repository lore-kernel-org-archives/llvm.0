Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE4E625
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 10:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661854904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L8duzOAx+2/mu9MVQu0yLiKegNKUgsUNinW+HTzCKOM=;
	b=hgGWBhpM3TwZJ2cuaPZ1esDbWxUuze40CFnxlJ2OX6Q2Msp5NXeGRswsE0lTljIsoJu4bS
	yxHS9Htv/9XwfMY23XTSwAoofnV+1OZUZ/DFDeyD6pY2wBv+wGw0QdVrnAshL1SrqSCovJ
	ILLrmWogPzGicBpzjVkPZBPSezzz9nk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-H1trQHsRMuS46SmCXNZ-_A-1; Tue, 30 Aug 2022 06:21:43 -0400
X-MC-Unique: H1trQHsRMuS46SmCXNZ-_A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2522B85A58B
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 10:21:43 +0000 (UTC)
Received: from [172.64.3.119] (unknown [10.30.33.184])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16D8F492C3B;
	Tue, 30 Aug 2022 10:21:43 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.0.0-rc3,
 mainline.kernel.org-clang, dcf8e563)
Date: Tue, 30 Aug 2022 10:21:40 -0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Message-Id: <40829.122083006214301763@us-mta-639.us.mimecast.lan>
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
    Commit message: tracing: Define the is_signed_type() macro once

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/51977

One or more kernel tests failed:

    Unrecognized or new issues:
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4979659

    We also see the following known issues which are not related to your ch=
anges:
        Issue: IBM System X3250 M4 - kernel: irq 16: nobody cared (try boot=
ing with the "irqpoll" option)
            URL: https://redhat.service-now.com/surl.do?n=3DRITM1202693
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: Storage - lvm thinp stqe test: resize2fs: Permission denied =
to resize filesystem
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1325
            Affected tests:
                 aarch64 - Storage - lvm thinp stqe test
                 ppc64le - Storage - lvm thinp stqe test
                   s390x - Storage - lvm thinp stqe test
                  x86_64 - Storage - lvm thinp stqe test
                  x86_64 (debug) - Storage - lvm thinp stqe test
        Issue: Storage - lvm thinp stqe test: ERROR: lvextend -L48 -rf test=
vg/snap1
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1349
            Affected tests:
                 aarch64 - Storage - lvm thinp stqe test
                 ppc64le - Storage - lvm thinp stqe test
                   s390x - Storage - lvm thinp stqe test
                  x86_64 - Storage - lvm thinp stqe test
                  x86_64 (debug) - Storage - lvm thinp stqe test
        Issue: avc:  denied  { sys_admin } for  pid=3D674004 comm=3D"system=
d-gpt-aut" capability=3D21  scontext=3Dsystem_u:system_r:systemd_gpt_genera=
tor_t:s0 tcontext=3Dsystem_u:system_r:systemd_gpt_generator_t:s0 tclass=3Dc=
apability permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2083900
            Affected tests:
                 aarch64 - Networking cki netfilter test
                 aarch64 - ALSA PCM loopback test
                 aarch64 - Storage - SCSI VPD
                 ppc64le - Networking cki netfilter test
                 ppc64le - ALSA PCM loopback test
                  x86_64 - Networking cki netfilter test
                  x86_64 - ALSA PCM loopback test
                  x86_64 - Storage - SCSI VPD
                  x86_64 (debug) - Networking cki netfilter test
                  x86_64 (debug) - Storage - SCSI VPD
        Issue: selftests: net: psock_snd.sh: Resource temporarily unavailab=
le
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/914
            Affected tests:
                  x86_64 (debug) - kselftests upstream - net
        Issue: kselftests upstream: FAIL: do_net_forwarding_config
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1318
            Affected tests:
                  x86_64 (debug) - kselftests upstream - forwarding
        Issue: kselftests upstream - tc: FAIL: do_tc-testing_config
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1319
            Affected tests:
                  x86_64 (debug) - kselftests upstream - tc
        Issue: kselftests upstream - bpf_test_progs: FAIL: Command 'do_bpf_=
test_progs_run' (Expected 0, got 1)
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1322
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: selinux-policy: serge-testsuite: Failed mount(2): Invalid ar=
gument
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1352
            Affected tests:
                 aarch64 - selinux-policy: serge-testsuite
                   s390x - selinux-policy: serge-testsuite
                  x86_64 - selinux-policy: serge-testsuite
                  x86_64 (debug) - selinux-policy: serge-testsuite
        Issue: Storage blktests - blk: scsi/007: Reading from scsi_debug fa=
iled
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2027550
            Affected tests:
                   s390x - Storage - blktests - blk
                  x86_64 - Storage - blktests - blk
        Issue: Storage - blktests - blk: nvme/012: ISOFS: unsupported/inval=
id hardware sector size 4096
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1375
            Affected tests:
                   s390x - Storage - blktests - blk
                  x86_64 - Storage - blktests - blk
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                  x86_64 - Storage - block - storage fio numa
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: xfstests - nfsv4.2: generic/130: output mismatch
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1368
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: AMTU (Abstract Machine Test Utility): misc/amtu FAIL
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1162
            Affected tests:
                 ppc64le - AMTU (Abstract Machine Test Utility)
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


If you find a failure unrelated to your changes, please tag it at https://d=
atawarehouse.cki-project.org .
This will prevent the failures from being incorrectly reported in the futur=
e.
If you don't have permissions to tag an issue, you can contact the CKI team=
 or
test maintainers.

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

