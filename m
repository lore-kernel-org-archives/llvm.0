Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2CF28E8
	for <llvm@lists.linux.dev>; Sat, 30 Jul 2022 11:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659178924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z4wQkTnm9WBHnFnipb77nH03LA1kfBMYBHPZY28C4+s=;
	b=A+e9FP25WLXQXSg6KhQ7Ldn6CF89sDOpmsH5DX62EcAyKpLdRRWDuK4R6OsGteXgF3+MIi
	iAhc3KSDCOMV0DZLKDsgXXBua3b+Z/zlMtgITNxkY/mOt4JQHL63YyCOzcOHuk/aQJGS6H
	JV4YiLso038co6v9VTeahTRbrRjGJ64=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-sweubFN8O7ChBPKPEa4VQA-1; Sat, 30 Jul 2022 07:02:03 -0400
X-MC-Unique: sweubFN8O7ChBPKPEa4VQA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C435E185A7B2
	for <llvm@lists.linux.dev>; Sat, 30 Jul 2022 11:02:02 +0000 (UTC)
Received: from [172.64.0.89] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A27BB40CF8E7;
	Sat, 30 Jul 2022 11:02:02 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for 5.19.0-rc8
 (mainline.kernel.org-clang) [1c8ac1c4]
Date: Sat, 30 Jul 2022 11:02:02 -0000
CC: xzhou@redhat.com, omosnace@redhat.com, feliu@redhat.com, mmalik@redhat.com,
 jbastian@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Message-Id: <09469.122073007020301270@us-mta-618.us.mimecast.lan>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cki-project@redhat.com
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/49257

One or more kernel tests failed:

    Unrecognized or new issues:
         aarch64 - xfstests - ext4
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4598770
         aarch64 - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4598773
           s390x - selinux-policy: serge-testsuite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4598936
          x86_64 - xfstests - ext4
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4598527
          x86_64 - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4598528
          x86_64 - xfstests - nfsv4.2
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4598529
          x86_64 - xfstests - cifsv3.11
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4598530
          x86_64 (debug) - stress: stress-ng - cpu-cache
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4598701
          x86_64 (debug) - Networking MACsec: sanity
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4598779
          x86_64 (debug) - xfstests - ext4
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4598842
          x86_64 (debug) - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4598843
          x86_64 (debug) - xfstests - nfsv4.2
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4598844
          x86_64 (debug) - xfstests - cifsv3.11
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4598845

    We also see the following known issues which are not related to your ch=
anges:
        Issue: gcc: error: unrecognized command-line option =E2=80=98-Qunus=
ed-arguments=E2=80=99
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/513
            Affected tests:
                 aarch64 - LTP - cve
                 aarch64 - LTP - sched
                 aarch64 - LTP - syscalls
                 aarch64 - LTP - can
                 aarch64 - LTP - commands
                 aarch64 - LTP - containers
                 aarch64 - LTP - dio
                 aarch64 - LTP - fs
                 aarch64 - LTP - fsx
                 aarch64 - LTP - math
                 aarch64 - LTP - hugetlb
                 aarch64 - LTP - mm
                 aarch64 - LTP - nptl
                 aarch64 - LTP - pty
                 aarch64 - LTP - ipc
                 aarch64 - LTP - tracing
                 aarch64 - Firmware test suite
                   s390x - LTP - cve
                   s390x - LTP - sched
                   s390x - LTP - syscalls
                   s390x - LTP - can
                   s390x - LTP - commands
                   s390x - LTP - containers
                   s390x - LTP - dio
                   s390x - LTP - fs
                   s390x - LTP - fsx
                   s390x - LTP - math
                   s390x - LTP - hugetlb
                   s390x - LTP - mm
                   s390x - LTP - nptl
                   s390x - LTP - pty
                   s390x - LTP - ipc
                   s390x - LTP - tracing
                  x86_64 - LTP - cve
                  x86_64 - LTP - sched
                  x86_64 - LTP - syscalls
                  x86_64 - LTP - can
                  x86_64 - LTP - commands
                  x86_64 - LTP - containers
                  x86_64 - LTP - dio
                  x86_64 - LTP - fs
                  x86_64 - LTP - fsx
                  x86_64 - LTP - math
                  x86_64 - LTP - hugetlb
                  x86_64 - LTP - mm
                  x86_64 - LTP - nptl
                  x86_64 - LTP - pty
                  x86_64 - LTP - ipc
                  x86_64 - LTP - tracing
                  x86_64 - Firmware test suite
                  x86_64 (debug) - kselftest build - bpf
                  x86_64 (debug) - kselftest build - net
                  x86_64 (debug) - LTP - cve
                  x86_64 (debug) - LTP - sched
                  x86_64 (debug) - LTP - syscalls
                  x86_64 (debug) - LTP - can
                  x86_64 (debug) - LTP - commands
                  x86_64 (debug) - LTP - containers
                  x86_64 (debug) - LTP - dio
                  x86_64 (debug) - LTP - fs
                  x86_64 (debug) - LTP - fsx
                  x86_64 (debug) - LTP - math
                  x86_64 (debug) - LTP - hugetlb
                  x86_64 (debug) - LTP - mm
                  x86_64 (debug) - LTP - nptl
                  x86_64 (debug) - LTP - pty
                  x86_64 (debug) - LTP - ipc
                  x86_64 (debug) - LTP - tracing
                  x86_64 (debug) - Firmware test suite
        Issue: kselftest build: /usr/include/gnu/stubs.h:7:11: fatal error:=
 'gnu/stubs-32.h' file not found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1222
            Affected tests:
                  x86_64 (debug) - kselftest build - bpf
                  x86_64 (debug) - kselftest build - net
        Issue: rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks
            URL: https://lore.kernel.org/all/CA+QYu4qTWaDzep2GGxm-63r-xJOFf=
2rFCCNhWupAgZdKE7HV6w@mail.gmail.com/T/#u
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: targetcli - module 'inspect' has no attribute 'getargspec'
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2102058
            Affected tests:
                 aarch64 - Storage - targetcli basic
                   s390x - Storage - targetcli basic
                  x86_64 - Storage - targetcli basic
                  x86_64 (debug) - Storage - targetcli basic
        Issue: Podman: 170-run-userns.bats: FAIL: Check group leaked into u=
ser namespace
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1166
            Affected tests:
                 aarch64 - Podman system test - as root
                  x86_64 - Podman system test - as root
                  x86_64 (debug) - Podman system test - as root
        Issue: Firmware test suite: modinfo: ERROR: Module efi_runtime not =
found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1235
            Affected tests:
                 aarch64 - Firmware test suite
                  x86_64 - Firmware test suite
                  x86_64 (debug) - Firmware test suite
        Issue: IBM System X3250 M4 - kernel: irq 16: nobody cared (try boot=
ing with the "irqpoll" option)
            URL: https://redhat.service-now.com/surl.do?n=3DRITM1202693
            Affected tests:
                  x86_64 - Boot test
        Issue: Podman: 110-history.bats: FAIL: CreatedSince and CreatedAt f=
rom image history should =3D=3D image list
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1160
            Affected tests:
                 aarch64 - Podman system test - as root
                 aarch64 - Podman system test - as user
                   s390x - Podman system test - as root
                   s390x - Podman system test - as user
        Issue: podman: cannot assign requested address
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/852
            Affected tests:
                   s390x - Podman system test - as user
        Issue: storage: software RAID testing: SELinux prevents mdadm
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1213
            Affected tests:
                 aarch64 - Storage - swraid simple_reshape
                   s390x - Storage - swraid simple_reshape
        Issue: kdump - sysrq-c: vmcore-dmesg.txt is empty
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2101983
            Affected tests:
                   s390x - kdump - sysrq-c
                   s390x - kdump - file-load
        Issue: [ppc64le] Boot test: tar: boot/vmlinux-kbuild-5.17.0: Cannot=
 write: No space left on device
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1047
            Affected tests:
                 ppc64le - Boot test
        Issue: [aarch64][coresight_etm4x][kernel 5.19.0] coresight-etm4x: p=
robe of ARMHC500:20 failed with error -17
            URL: https://lore.kernel.org/all/CA+QYu4ogiTa1V20aqxFqBrMH0z927=
YNNN2O=3DCKma+=3DM_8E81iQ@mail.gmail.com/
            Affected tests:
                 aarch64 - Boot test
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
        Issue: SELinux prevents sendmail.service while running Memory funct=
ion: kaslr
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1169
            Affected tests:
                 aarch64 - Reboot test


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

