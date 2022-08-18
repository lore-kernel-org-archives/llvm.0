Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE30315AE
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 00:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660782701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=203DRcvyaTDoYNfX/I15M5iWAx5TYwoX0dHBVCoZZ0Y=;
	b=ilHi9Ju/eWwmX5k4/hT1Pwec6L568OuzV2G2SsCkPlSU+taW9GRHFRDB8ZMlYw4combVXT
	dn74QfTWw77ueGvTmIbqjT3JMcNc/gVWHgMtxuCkvXPqkCmwhtcJqnkVcdD5b0vTRgapUy
	kPG/VcmEy9gRfuMkDCFw0K8DF3V5b8g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-TJL-37LuMQexs3VhjSEHpg-1; Wed, 17 Aug 2022 20:31:40 -0400
X-MC-Unique: TJL-37LuMQexs3VhjSEHpg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B0658032FB
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 00:31:40 +0000 (UTC)
Received: from [172.64.10.10] (unknown [10.30.33.221])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF051492C3B;
	Thu, 18 Aug 2022 00:31:39 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for 6.0.0-rc1
 (mainline.kernel.org-clang) [274a2eeb]
Date: Thu, 18 Aug 2022 00:31:38 -0000
CC: xzhou@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Message-Id: <70516.122081720314000536@us-mta-596.us.mimecast.lan>
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/51018

One or more kernel tests failed:

    Unrecognized or new issues:
         aarch64 - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4843196
          x86_64 - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4843393

    We also see the following known issues which are not related to your ch=
anges:
        Issue: gcc: error: unrecognized command-line option =E2=80=98-Qunus=
ed-arguments=E2=80=99
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/513
            Affected tests:
                 aarch64 - Firmware test suite
                  x86_64 (debug) - kselftest build - bpf
        Issue: [upstream] RIP: 0010:i5000_init_one+0x938/0x990 [i5000_edac]
            URL: https://lore.kernel.org/all/CA+QYu4pF9X2UwG+UtNmUqAeWX2oZx=
NTgh2z0DerZ0WdAWAkwBw@mail.gmail.com/
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: selinux-policy: serge-testsuite: binder/test: TIMEOUT
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1345
            Affected tests:
                 aarch64 - selinux-policy: serge-testsuite
                  x86_64 - selinux-policy: serge-testsuite
                  x86_64 (debug) - selinux-policy: serge-testsuite
        Issue: selinux-policy: serge-testsuite: RIP: 0010:find_vma+0x6d/0xc=
0
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1327
            Affected tests:
                 aarch64 - selinux-policy: serge-testsuite
                  x86_64 - selinux-policy: serge-testsuite
                  x86_64 (debug) - selinux-policy: serge-testsuite
        Issue: Storage - blktests - nvme-tcp: nvme/030: failed to lookup su=
bsystem for controller nvme0
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1274
            Affected tests:
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: Libkcapi AF_ALG test: Got Allocation of cbc(aes) cipher fail=
ed
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1354
            Affected tests:
                 aarch64 - Libkcapi AF_ALG test
                   s390x - Libkcapi AF_ALG test
                  x86_64 - Libkcapi AF_ALG test
        Issue: Storage - lvm thinp stqe test: resize2fs: Permission denied =
to resize filesystem
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1325
            Affected tests:
                 aarch64 - Storage - lvm thinp stqe test
                   s390x - Storage - lvm thinp stqe test
                  x86_64 - Storage - lvm thinp stqe test
        Issue: Storage - lvm thinp stqe test: ERROR: lvextend -L48 -rf test=
vg/snap1
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1349
            Affected tests:
                 aarch64 - Storage - lvm thinp stqe test
                   s390x - Storage - lvm thinp stqe test
                  x86_64 - Storage - lvm thinp stqe test
        Issue: Storage - swraid simple_reshape: BUG bio-152 (Not tainted): =
Objects remaining in bio-152 on __kmem_cache_shutdown()
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1255
            Affected tests:
                  x86_64 - Storage - swraid simple_reshape
        Issue: Storage - swraid simple_reshape: (panic) RIP: 0010:mempool_f=
ree+0x53/0x80
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1359
            Affected tests:
                  x86_64 - Storage - swraid simple_reshape
        Issue: kdump - sysrq-c: ERROR: No vmcore-dmesg.txt saved in /var/cr=
ash
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1339
            Affected tests:
                  x86_64 - kdump - sysrq-c
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: Bug 1895913 - nvme-tcp: IO timeout and reconnecting never es=
tablished after max reconnecting reached
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1895913
            Affected tests:
                   s390x - Storage - blktests - nvme-tcp
        Issue: selinux-policy: serge-testsuite: Failed mount(2): Invalid ar=
gument
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1352
            Affected tests:
                   s390x - selinux-policy: serge-testsuite
        Issue: [ppc64le] Boot test: tar: boot/vmlinux-kbuild-5.17.0: Cannot=
 write: No space left on device
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1047
            Affected tests:
                 ppc64le - Boot test
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                 aarch64 - Storage - block - storage fio numa
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
        Issue: Firmware test suite: modinfo: ERROR: Module efi_runtime not =
found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1235
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

