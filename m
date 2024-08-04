Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0167B1DFE8
	for <llvm@lists.linux.dev>; Sun,  4 Aug 2024 17:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722792131; cv=none; b=bqy83PpHirWrEo0UYBe/5w98t6xi9hNs24/lSwal+tiizSFEX+EKZwOko7Kf1tI3fLCb8snywlEeNBa5d4RyiVoXTk98hLYbmApfDngzjw0faMLGvgGQ9Qioj/yeqYhlRIWXWgO1IVgWlAIOcx1nJzeOVCQs37N3t+SLg+NjrHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722792131; c=relaxed/simple;
	bh=fG6yFPkgOrKAbnfSKXhBNHQHRqLFMj6PkQ5KojSJaUI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=VNGQASYA3Bgaj75CFGUWFgBp2kM5JSzWpEGAbACUvVEaxDoynBYfc7R1vxtfUnKcnJprAr28L6cA7d4ZCEIdSWlWE0BL26ORVIPaqhEkRiHyu0ILra3Lavgfn6fWP35OZRgqUYtJ04ftxN4CEUF96/e3eJXvWPsCv6Cvu5ursXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gclqyL63; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gclqyL63"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722792128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gUQRzfgFbl1KHE+9NbypidqYDLoRVFXmrM4V+2F09Po=;
	b=gclqyL63yy+OVnPSioXSO8nA9QO1+u2wgzMCk+l9g7hOQYaPodhQeLjMUxwGNHenIqJ/bh
	R//PBajMElaatdgwPhXQ8A5/byazmMoJr9Qd3zP6U9IkQLbUfUwnlI5jrzpDJ4fOL4KQd0
	fhM322+GmdM7sSxs77mkqGgsBsGzokM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-259-myxbhL9zO7Cj2gvmMckimg-1; Sun,
 04 Aug 2024 13:22:06 -0400
X-MC-Unique: myxbhL9zO7Cj2gvmMckimg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A52381955F43
	for <llvm@lists.linux.dev>; Sun,  4 Aug 2024 17:22:05 +0000 (UTC)
Received: from [172.64.4.38] (unknown [10.30.33.216])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 13B50195605A;
	Sun,  4 Aug 2024 17:22:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc1,
 mainline.kernel.org-clang, a5dbd76a)
Date: Sun, 04 Aug 2024 17:22:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <60115.124080413220600533@us-mta-259.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'x86-urgent-2024-08-04' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1400215885

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1400215885-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1400215885-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1400215885-x86_64-kernel-debug


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

