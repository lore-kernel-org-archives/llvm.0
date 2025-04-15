Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E982192E3
	for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 17:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744738930; cv=none; b=psc2RWCnlcs3aHFZsVPKujJMn4eEp9+NUZ7lHGWrmPtPKz7rVUzmfQQmyXu1GlhA0FxfZ0+hSQi4eWlCZXkp44w1QqSf4GlmXidYcadaEUJ9hMEi8V39M+RXWlNecTKtX6wxWjojKBh79ru/F5hM0hvrA+1QNIkVu6ztNFzJAgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744738930; c=relaxed/simple;
	bh=DDuG4WvpWULhUkfBV4LdDBu+rJ9lae8BCYVPneFkuRs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=oVD75nvjTerXBKeJb/mr9nnS25wuSEI8wmYTVJGQ1xwxIs5ShLep1B/1BvuLm/t8b5jYEJtI9GzqWGfZTHOx0xPbaestl9wNWQ1C7TP9cSt4E3bUbHAOPRi8foMO3JurzjklH52MvUgtogc8WA7+jR8aVXIVlXF2XdWJ0nCwxxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iJ6+l58g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iJ6+l58g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744738927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X26Jxjr+G9MioQif1YqzPXehtTfC+2z3VGtAxD1lHRo=;
	b=iJ6+l58gPCJmq/i6LI3m/pOGUweX0TU2guwiPPZDG23nGJyYordIZOm41ni+WezYPZsTxw
	B3rtGDRMBErfUK8idArEaxA/lt+7QlyXH8gK7QwubCAEIEsH0Xwcmq9KGqPkJGAH7UW2Mq
	OV2HlHzM4E8MXDGkypqpNZYUxm9yXcQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-BKZSryq-MeGICcRmecqvKg-1; Tue,
 15 Apr 2025 13:42:06 -0400
X-MC-Unique: BKZSryq-MeGICcRmecqvKg-1
X-Mimecast-MFC-AGG-ID: BKZSryq-MeGICcRmecqvKg_1744738925
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 699FD195608A
	for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 17:42:05 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F2A391955BEF;
	Tue, 15 Apr 2025 17:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc2,
 upstream-mainline, 1a1d569a)
Date: Tue, 15 Apr 2025 17:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <66713.125041513420604473@us-mta-638.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DPPmz1pQhrT014mFcJQ9svIbyx_HP2mnPWuQF4uSsqc_1744738925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'edac_urgent_for_v6.15_rc3' of git://git.kern=
el.org/pub/scm/linux/kernel/git/ras/ras

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1770010170

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1770010170-x86_64-kernel-debug


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

