Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3407A
	for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 08:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656406229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b2olOWXyEV7BxESL4kMAeWkW7L4yDI3xfngfvN5UKQg=;
	b=iY30SYfJnS6OWnegJj+5NoLl/bsIpkAYDBeF3ytfa+sLvIC3DQkzJVm1qq1i9mrcXqzSIn
	jxQYQOssMs8fV9/D+v8AwE2SMs4vq8MqaZpIPOtcqqraQ/HJ0vJerTq7gBSbN1vbnQVNed
	ooXbqVinj8qln8ki2+VAyQxmQKlrRPE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-5O2U9-lMP7ex--3MNgVcUQ-1; Tue, 28 Jun 2022 04:50:28 -0400
X-MC-Unique: 5O2U9-lMP7ex--3MNgVcUQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADB8185A580
	for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 08:50:27 +0000 (UTC)
Received: from [172.64.9.15] (unknown [10.30.34.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 90E2D2026D64;
	Tue, 28 Jun 2022 08:50:27 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for 941e3e79
 (mainline.kernel.org-clang)
Date: Tue, 28 Jun 2022 08:50:27 -0000
CC: bhe@redhat.com, xiawu@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Message-Id: <73878.122062804502800192@us-mta-629.us.mimecast.lan>
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/46416

One or more kernel tests failed:

    Unrecognized or new issues:
           s390x - kdump - sysrq-c
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4118714
           s390x - kdump - file-load
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4118715

    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - Storage - blktests - nvme-tcp
                   Issue: Bug 1895913 - nvme-tcp: IO timeout and reconnecti=
ng never established after max reconnecting reached
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D189=
5913
         aarch64 - Networking cki netfilter test
                   Issue: avc:  denied  { sys_admin } for  pid=3D674004 com=
m=3D"systemd-gpt-aut" capability=3D21  scontext=3Dsystem_u:system_r:systemd=
_gpt_generator_t:s0 tcontext=3Dsystem_u:system_r:systemd_gpt_generator_t:s0=
 tclass=3Dcapability permissive=3D0
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D208=
3062
         aarch64 - ALSA PCM loopback test
                   Issue: avc:  denied  { sys_admin } for  pid=3D674004 com=
m=3D"systemd-gpt-aut" capability=3D21  scontext=3Dsystem_u:system_r:systemd=
_gpt_generator_t:s0 tcontext=3Dsystem_u:system_r:systemd_gpt_generator_t:s0=
 tclass=3Dcapability permissive=3D0
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D208=
3062
         aarch64 - Storage - dm/common
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
         aarch64 - Storage - lvm thinp stqe test
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
         aarch64 - Storage - lvm snapper test
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
         aarch64 - Storage - targetcli basic
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
         aarch64 - Podman system test - as root
                   Issue: Podman: 110-history.bats: FAIL: CreatedSince and =
CreatedAt from image history should =3D=3D image list
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1160
                   Issue: Podman: 170-run-userns.bats: FAIL: Check group le=
aked into user namespace
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1166
                   Issue: Podman: Error: netavark: failed to configure brid=
ge and veth interface
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1186
         aarch64 - Podman system test - as user
                   Issue: Podman: 110-history.bats: FAIL: CreatedSince and =
CreatedAt from image history should =3D=3D image list
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1160
         aarch64 - Storage - lvm cache test
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
         aarch64 - Storage - swraid simple_reshape
                   Issue: storage: software RAID testing: SELinux prevents =
mdadm
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1213
         aarch64 - xfstests - btrfs
                   Issue: xfstests - _check_xfs_filesystem: filesystem on /=
dev/nvme0n1p4 is inconsistent (r)
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D198=
9409
         ppc64le - AMTU (Abstract Machine Test Utility)
                   Issue: AMTU (Abstract Machine Test Utility): misc/amtu F=
AIL
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1162
         ppc64le - Storage - dm/common
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
         ppc64le - Storage - lvm thinp stqe test
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
         ppc64le - Storage - lvm snapper test
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
         ppc64le - Storage - targetcli basic
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
         ppc64le - Podman system test - as root
                   Issue: Podman: 110-history.bats: FAIL: CreatedSince and =
CreatedAt from image history should =3D=3D image list
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1160
                   Issue: Podman: 170-run-userns.bats: FAIL: Check group le=
aked into user namespace
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1166
                   Issue: Podman: Error: netavark: failed to configure brid=
ge and veth interface
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1186
         ppc64le - Podman system test - as user
                   Issue: Podman: 110-history.bats: FAIL: CreatedSince and =
CreatedAt from image history should =3D=3D image list
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1160
         ppc64le - Storage - lvm cache test
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
         ppc64le - Storage - swraid simple_reshape
                   Issue: storage: software RAID testing: SELinux prevents =
mdadm
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1213
         ppc64le - selinux-policy: serge-testsuite
                   Issue: selinux-policy: serge-testsuite: Failed test at p=
erf_event/test line 88, 104, 109, 115
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/814
           s390x - Storage - blktests - blk
                   Issue: Storage blktests - blk: scsi/007: Reading from sc=
si_debug failed
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D202=
7550
           s390x - Storage - dm/common
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
           s390x - Storage - lvm thinp stqe test
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
           s390x - Storage - lvm snapper test
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
           s390x - Storage - targetcli basic
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
           s390x - Podman system test - as root
                   Issue: Podman: 110-history.bats: FAIL: CreatedSince and =
CreatedAt from image history should =3D=3D image list
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1160
                   Issue: Podman: Error: netavark: failed to configure brid=
ge and veth interface
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1186
           s390x - Podman system test - as user
                   Issue: Podman: 110-history.bats: FAIL: CreatedSince and =
CreatedAt from image history should =3D=3D image list
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1160
           s390x - Storage - lvm cache test
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
           s390x - Storage - swraid simple_reshape
                   Issue: storage: software RAID testing: SELinux prevents =
mdadm
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1213
          x86_64 - kselftest build - net
                   Issue: gcc: error: unrecognized command-line option =E2=
=80=98-Qunused-arguments=E2=80=99
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/513
          x86_64 - kselftest build - bpf
                   Issue: gcc: error: unrecognized command-line option =E2=
=80=98-Qunused-arguments=E2=80=99
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/513
          x86_64 - Storage - dm/common
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
          x86_64 - Storage - lvm thinp stqe test
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
          x86_64 - Storage - targetcli basic
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
          x86_64 - Memory function: kaslr
                   Issue: SELinux prevents sendmail.service while running M=
emory function: kaslr
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1169
          x86_64 - Storage - lvm cache test
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
          x86_64 - Reboot test
                   Issue: SELinux prevents sendmail.service while running M=
emory function: kaslr
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1169
          x86_64 - Boot test
                   Issue: rcu: INFO: rcu_sched detected expedited stalls on=
 CPUs/tasks
                          https://lore.kernel.org/all/CA+QYu4qTWaDzep2GGxm-=
63r-xJOFf2rFCCNhWupAgZdKE7HV6w@mail.gmail.com/T/#u
          x86_64 - Storage - block - storage fio numa
                   Issue: Storage block - storage fio numa: Performance com=
parison: min:40535 * 1.15 < max:81259
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D203=
2094
          x86_64 - Storage - dm/common
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
          x86_64 - Storage - lvm thinp stqe test
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
          x86_64 - Storage - lvm snapper test
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
          x86_64 - Storage - targetcli basic
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
          x86_64 - Podman system test - as root
                   Issue: Podman: 170-run-userns.bats: FAIL: Check group le=
aked into user namespace
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1166
                   Issue: Podman: Error: netavark: failed to configure brid=
ge and veth interface
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1186
          x86_64 - Podman system test - as user
                   Issue: Podman: 500-networking.bats: FAIL: Output does ma=
tch container ID
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1167
          x86_64 - Storage - lvm cache test
                   Issue: storage stqe: Failed to build ssh2-python
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1229
          x86_64 - xfstests - nfsv4.2
                   Issue: avc:  denied  { name_bind } for  pid=3D897864 com=
m=3D"rpcbind" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontex=
t=3Dsystem_u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=
=3D1
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D198=
3604#c3


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

