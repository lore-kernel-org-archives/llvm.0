Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9327D3E4
	for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 21:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719609815; cv=none; b=ThslCE6ZhZXcDylaM5pJBTEa85XSnfZqZp24O7rdZkGcZoNCqCYb/kX771em3otMS0vlykJLLSS6k72Op8r6+QsqpIAYlmrkhIyKi+PYu9cXXRAUhZ6VIAyPDKLGVH3oXJ2/yRhANpZZO15x1K9STkzkNQUwnf0UpFVSZD3KzCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719609815; c=relaxed/simple;
	bh=HH67rodzJRwlAY/RE31JU27M9wrH88edjAp7/R+sL2c=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=anApetNTaVa5MyWcUwVUWgOlADmiEwjEVSDm6fCVD+hqgdCZxTdEilVuWuUy80xRGgN54Nx9sLNsycuOkxAiZDGS91fjOuHRodgmEsdPfIojlODaCn7RGBOxCgjesDr9kIGkDP+wNYKDUy5ZOCqSdEiqU/YCicPdrloGB9ZgYRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JgCjzcwr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JgCjzcwr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719609812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VSVjzBjdGaO0oPELVx0OQbeunHxH1JMjZsQ0i9q82eU=;
	b=JgCjzcwr++0pEMPy9FKQsXTRqz4nS++TGb1UXDlN7k6YQ8akp2pXaD3E3hgP6w5dH1T8LM
	WB+z4UdO8Qzd9wOoCmV7KJpGlPsbqMVZtqxJjt6QxsMB4lC2Fm7Mxr6mMN67KYm4CSbs6X
	hQ91cC/tTYUATREiy3XidOptWX+0JVU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-323-0hNAGDmVN8-iyfkUYqO-Mw-1; Fri,
 28 Jun 2024 17:23:31 -0400
X-MC-Unique: 0hNAGDmVN8-iyfkUYqO-Mw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 57E61195608B
	for <llvm@lists.linux.dev>; Fri, 28 Jun 2024 21:23:30 +0000 (UTC)
Received: from [172.64.3.27] (unknown [10.30.33.101])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8F4BF196BE81;
	Fri, 28 Jun 2024 21:23:29 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 10 of 192): Test report for master
 (6.10.0-rc5, mainline.kernel.org-clang, 5bbd9b24)
Date: Fri, 28 Jun 2024 21:23:29 -0000
To: bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <76721.124062817233100245@us-mta-323.us.mimecast.lan>
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
    Commit message: Merge tag 'v6.10-p4' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/herbert/crypto-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1351747572

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1351747572-x86_64-kernel_upt_35
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rhel-10] xfstests - cifsv3.11 - generic/207 - error in bloc=
k: expected 4096 bytes, received 0
            URL: https://issues.redhat.com/browse/RHEL-39974
            Affected tests:
                xfstests - cifsv3.11 [x86_64, x86_64 (debug)]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:=20
    Boot test [s390x]
    CKI/restraint [s390x]
    machineinfo [s390x]
    Reboot test [s390x]
    SELinux Custom Module Setup [s390x]
    Storage - blktests - blk - upstream [s390x]
    Storage - blktests - nvme-tcp - upstream [s390x]
    Storage - swraid scsi_raid [s390x]
    stress: stress-ng - cpu-cache [s390x]
    stress: stress-ng - memory [s390x]


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

