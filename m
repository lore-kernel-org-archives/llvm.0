Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5735A10F0
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 05:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662094849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MWgnZfX6QgHSL7nhS52V3/L88B51hDUJZikned0P/Z4=;
	b=DLkABpvoJqBXK77kWstV+I1sckVPrYJO3MlZJvvon4zAPJ/CUCZLMCSdC3GpJiAq1wLU6w
	S/rBYyxTVIPpDaCESjcFudX1VVYUGrWhSckb758D5Qm7AGq5e9dzNHFCGVluXy2eIAmN9m
	JrkEpsxrqr7qdXdtEDsk7j36faS8p6s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-Aw8E3T6ZMhyVBdliQJLkog-1; Fri, 02 Sep 2022 01:00:46 -0400
X-MC-Unique: Aw8E3T6ZMhyVBdliQJLkog-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53B1180A0AE
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 05:00:46 +0000 (UTC)
Received: from [172.64.3.82] (unknown [10.30.33.184])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44F401415125;
	Fri,  2 Sep 2022 05:00:46 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4pyF?= PASS (90/376 SKIPPED): Test report for master
 (6.0.0-rc3, mainline.kernel.org-clang, 42e66b1c)
Date: Fri, 02 Sep 2022 05:00:45 -0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Message-Id: <15278.122090201004606323@us-mta-354.us.mimecast.lan>
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
    Commit message: Merge tag 'net-6.0-rc4' of git://git.kernel.org/pub/scm=
/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/52364

One or more kernel tests failed:

    We also see the following known issues which are not related to your ch=
anges:
        Issue: gcc: error: unrecognized command-line option =E2=80=98-Qunus=
ed-arguments=E2=80=99
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/513
            Affected tests:
                 aarch64 - Firmware test suite
                  x86_64 (debug) - kselftest build - bpf
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
                  x86_64 (debug) - Networking cki netfilter test
                  x86_64 (debug) - Storage - SCSI VPD
                  x86_64 (debug) - kselftests upstream - forwarding
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
        Issue: IBM System X3250 M4 - kernel: irq 16: nobody cared (try boot=
ing with the "irqpoll" option)
            URL: https://redhat.service-now.com/surl.do?n=3DRITM1202693
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: xfstests - nfsv4.2: generic/130: output mismatch
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1368
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: [ppc64le] Boot test: tar: boot/vmlinux-kbuild-5.17.0: Cannot=
 write: No space left on device
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1047
            Affected tests:
                 ppc64le - Boot test
        Issue: [upstream] [aarch64] [ampere] [altramax] 5.19.0-rc8 - panic =
__efi_rt_asm_wrapper+0x2c/0x4c efi_call_rts+0x260/0x3d4
            URL: https://lore.kernel.org/all/CA+QYu4r50dDuTyWbAqjjbvniW6O6N=
r4V+1A_G2f37EVHJtM3_Q@mail.gmail.com/T/#t
            Affected tests:
                 aarch64 - Networking cki netfilter test
                 aarch64 - ALSA PCM loopback test
                 aarch64 - Storage - SCSI VPD
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

