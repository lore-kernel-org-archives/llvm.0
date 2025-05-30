Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8674D27CCDA
	for <llvm@lists.linux.dev>; Fri, 30 May 2025 19:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748634134; cv=none; b=TCclcuPcDFQntbasELDrdKj/82/8dGD0w0N2f90izS9q896qjBHYELT3wuNxj4bjJJFy/cffCrtPqjDpsO9uVEnUuqS2GcnvI7yxWd8t6JDO2U6llPDqxbDheAeI0AWIQKi7BxIrbZwPHMQBdtoa4mkrKFQmMLejK/pNX4akrUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748634134; c=relaxed/simple;
	bh=fN0sOxb7xAsKYDp8++vZAKcHQXN1708K1k3fgoNhMhs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ZQo9yZJQ9alOWs/ayGdV/hX/bGtog7Ovru0RlB4aOeJ1mJNIR1XpXDgpG3WEfWoA5kEPhuY/1gMYie6gw9KONmeEPggdA77+qOXQKT6rsEIJUS8ySPYIJlZi0EzleCb0zCNHTXrfBQvEBwgk7JVbW0UjX/FK3sq0QACKouy6oCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cuWBkbij; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cuWBkbij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748634131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=geeKhD4387H1FeBQPmMsvDF/oJ1eCQaqAIWa4VKugbE=;
	b=cuWBkbijXyZq65dwKXLgiYipxjMBIh+mueVwPFl7lu7mptR5aZ6yRgLl5NLB2b9zSdagmO
	02XyZqXs2Ed2QYeqohE+RjKmfKdVKPO0FX3rWsPv72KrVEiYiNCHNeL+C7TpwU51wj/Esj
	DO9XWJaE+sjAig+bqDuRPrvacZOZEqM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-371-039xHlSTNNqjqj1TLQWlqQ-1; Fri,
 30 May 2025 15:42:09 -0400
X-MC-Unique: 039xHlSTNNqjqj1TLQWlqQ-1
X-Mimecast-MFC-AGG-ID: 039xHlSTNNqjqj1TLQWlqQ_1748634129
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E8E521956095
	for <llvm@lists.linux.dev>; Fri, 30 May 2025 19:42:08 +0000 (UTC)
Received: from [172.20.48.73] (unknown [10.30.45.91])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 08F341955D88;
	Fri, 30 May 2025 19:42:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 9 of 100): Test report for master
 (6.15.0, upstream-mainline, 90b83efa)
Date: Fri, 30 May 2025 19:42:07 -0000
To: omosnace@redhat.com, ftjahjad@redhat.com, mmalik@redhat.com,
 bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <69470.125053015420901088@us-mta-371.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g8TTelPkPstFpRkg_5SjxBihjQfVG75Tio_ig0UzqUo_1748634129
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'bpf-next-6.16' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/bpf/bpf-next

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1841970180

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1841970180-x86_64-kernel-debug_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        selinux-policy: serge-testsuite
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1841970180-ppc64le-kernel_upt_5
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [aarch64][coresight_etm4x][kernel 5.19.0] coresight-etm4x: p=
robe of ARMHC500:20 failed with error -17
            URL: https://lore.kernel.org/all/CA+QYu4ogiTa1V20aqxFqBrMH0z927=
YNNN2O=3DCKma+=3DM_8E81iQ@mail.gmail.com/
            Affected tests:
                Boot test [aarch64]
                Reboot test [aarch64]


Tests that were not ran because of internal issues:
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    Reboot test [x86_64]
    xfstests - btrfs [x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [x86_64]


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

