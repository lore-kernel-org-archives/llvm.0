Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046461363
	for <llvm@lists.linux.dev>; Sun,  7 Aug 2022 09:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659864044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LAtcjTWZDmgKA/vtbH/Knizf63z7I5Tq9Ty4AFbqSEI=;
	b=dNikaYQ7hKt44WQZB/5A4e5qz1KNGlQRhdDZkPFw0QKq2g6Jcz5M9LJrOAHQ6Rg8rLG/W3
	uz+egxhIhr3EONfkEUBJqw3e7z5OJuSEF0659v+7kitKyIqjXlCP511axuEme9sTf00LSj
	5DU6hKfCU/rJJ2T8iuzjIaARFwTRf/U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-r3KRb0ICO6SNB6UUlLlr8Q-1; Sun, 07 Aug 2022 05:20:40 -0400
X-MC-Unique: r3KRb0ICO6SNB6UUlLlr8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35D223C00088
	for <llvm@lists.linux.dev>; Sun,  7 Aug 2022 09:20:40 +0000 (UTC)
Received: from [172.64.11.40] (unknown [10.30.32.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 179432026D4C;
	Sun,  7 Aug 2022 09:20:40 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for 5.19.0
 (mainline.kernel.org-clang) [1612c382]
Date: Sun, 07 Aug 2022 09:20:39 -0000
CC: mmalik@redhat.com, omosnace@redhat.com, fsuba@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Message-Id: <42893.122080705204000189@us-mta-151.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/50163

One or more kernel tests failed:

    Unrecognized or new issues:
         aarch64 - Storage - lvm thinp stqe test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4735597
         aarch64 - selinux-policy: serge-testsuite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4735619
           s390x - Storage - lvm thinp stqe test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4735442
          x86_64 - Storage - lvm thinp stqe test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4735290
          x86_64 - selinux-policy: serge-testsuite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4735318
          x86_64 (debug) - Storage - lvm thinp stqe test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4735504
          x86_64 (debug) - selinux-policy: serge-testsuite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4735523

    We also see the following known issues which are not related to your ch=
anges:
        Issue: gcc: error: unrecognized command-line option =E2=80=98-Qunus=
ed-arguments=E2=80=99
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/513
            Affected tests:
                 aarch64 - Firmware test suite
                  x86_64 - Firmware test suite
                  x86_64 (debug) - kselftest build - bpf
                  x86_64 (debug) - kselftest build - net
                  x86_64 (debug) - Firmware test suite
        Issue: kselftest build: /usr/include/gnu/stubs.h:7:11: fatal error:=
 'gnu/stubs-32.h' file not found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1222
            Affected tests:
                  x86_64 (debug) - kselftest build - bpf
                  x86_64 (debug) - kselftest build - net
        Issue: [upstream] RIP: 0010:i5000_init_one+0x938/0x990 [i5000_edac]
            URL: https://lore.kernel.org/all/CA+QYu4pF9X2UwG+UtNmUqAeWX2oZx=
NTgh2z0DerZ0WdAWAkwBw@mail.gmail.com/
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: Firmware test suite: modinfo: ERROR: Module efi_runtime not =
found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1235
            Affected tests:
                 aarch64 - Firmware test suite
                  x86_64 - Firmware test suite
                  x86_64 (debug) - Firmware test suite
        Issue: SELinux prevents sendmail.service while running Memory funct=
ion: kaslr
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1169
            Affected tests:
                  x86_64 - Memory function: kaslr
                  x86_64 - Reboot test
                  x86_64 (debug) - kselftests upstream - net
                  x86_64 (debug) - kselftests upstream - forwarding
                  x86_64 (debug) - kselftests upstream - tc
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
                  x86_64 (debug) - Memory function: kaslr
                  x86_64 (debug) - Reboot test
        Issue: Internal Network Outage
            URL: https://docs.cki-project.org/failures/#internal-network-ou=
tage
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: Storage - blktests: fail to build mount_clear_sock: error: r=
edeclaration of enum fsconfig_command
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1300
            Affected tests:
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - blktests - nvme-tcp
                 aarch64 - Storage - blktests - nvmeof-mp
                   s390x - Storage - blktests - blk
                   s390x - Storage - blktests - nvme-tcp
                   s390x - Storage - blktests - nvmeof-mp
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
                  x86_64 - Storage - blktests - nvmeof-mp
        Issue: stress: stress-ng: fail to build core-affinity: error: redec=
laration of enum fsconfig_command
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1303
            Affected tests:
                 aarch64 - stress: stress-ng - cpu-cache
                 aarch64 - stress: stress-ng - memory
                   s390x - stress: stress-ng - cpu-cache
                   s390x - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - cpu-cache
                  x86_64 - stress: stress-ng - memory
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                  x86_64 - Storage - block - storage fio numa
        Issue: xfstests: fail to build detached_mounts_propagation: error: =
redeclaration of 'enum fsconfig_command'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1302
            Affected tests:
                 aarch64 - xfstests - ext4
                 aarch64 - xfstests - xfs
                 aarch64 - xfstests - btrfs
                  x86_64 - xfstests - ext4
                  x86_64 - xfstests - xfs
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 - xfstests - btrfs
        Issue: [ppc64le] Boot test: tar: boot/vmlinux-kbuild-5.17.0: Cannot=
 write: No space left on device
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1047
            Affected tests:
                 ppc64le - Boot test
        Issue: avc:  denied  { sys_admin } for  pid=3D674004 comm=3D"system=
d-gpt-aut" capability=3D21  scontext=3Dsystem_u:system_r:systemd_gpt_genera=
tor_t:s0 tcontext=3Dsystem_u:system_r:systemd_gpt_generator_t:s0 tclass=3Dc=
apability permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2083900
            Affected tests:
                 aarch64 - Networking cki netfilter test
                 aarch64 - ALSA PCM loopback test
                 aarch64 - Storage - SCSI VPD
                 aarch64 - Storage - software RAID testing
        Issue: Firmware test suite: (Kernel panic) __efi_rt_asm_wrapper+0x2=
c/0x4c
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1310
            Affected tests:
                 aarch64 - Firmware test suite
        Issue: [upstream] [aarch64] WARNING: CPU: 0 PID: 1 at mm/page_alloc=
.c:5407 __alloc_pages+0x1a0/0x290
            URL: https://lore.kernel.org/all/CA+QYu4rPbfH-4wNR06Vn=3D31RCGK=
FFEB-KRskn52Jtig_UugYzg@mail.gmail.com
            Affected tests:
                 aarch64 - Boot test


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

