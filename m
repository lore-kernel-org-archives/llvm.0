Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A215E208AD
	for <llvm@lists.linux.dev>; Sat, 23 Nov 2024 06:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732343591; cv=none; b=CW2glx5HjRbYMk9+/Fa3HRSA2LNiu6kiqpRmFMGAyi6DfWWlpvlmdRwrUt4bTigjuDo0/4OFm2fbkD5iNDbcJF1S5Or0lGOEUpSGyDnQvgiqiiD8uS6uyw2XrplPrTwB86JZsxu91r9vhPuHm9Z65NexeeJT14LSLtiMBVpWOZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732343591; c=relaxed/simple;
	bh=0TW/Cy8aYI+j0xLB6UY8URAvjPu6ZdTQyhy+w1ABkto=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=fGba0POUs2RtgroKGl+rq2gF9ZhpxxnlonXOgumrSHPh9NAFRNqkYqsr6VZco3UehO6sY+g94PQtW7yKzuH9UHsn/HxaeK5EGdRiyzAUERw7ePcuOAuTgNY7wgg7N83hcETcspc2UaHyZq6XbBJOLTVrh2ZjUH9fykUUe+e8Om0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gHPBBaOW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gHPBBaOW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732343587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PrUdgkKC5CIPliNL5wRwDrS9SIppScj0R9tEpH7DkNo=;
	b=gHPBBaOWMmEZIE+6ciiUwEKPzcW785d6nPcPmysgnBluUPNOa2WJHzZJD9CYIWyx3OQpCM
	S4Kkao+/3Z6fMQDymMiAhWehKOs/E7J6w5BN6AZ3isqBHBGMH/mMLk0Yvylc+pLNC0VlaG
	wak6x9amzLZfUHvyDtUteYFxBgV2FxA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-198-VBqYVIiJOBy_OyOCQYIDlg-1; Sat,
 23 Nov 2024 01:33:05 -0500
X-MC-Unique: VBqYVIiJOBy_OyOCQYIDlg-1
X-Mimecast-MFC-AGG-ID: VBqYVIiJOBy_OyOCQYIDlg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C17CC1956083
	for <llvm@lists.linux.dev>; Sat, 23 Nov 2024 06:33:04 +0000 (UTC)
Received: from [172.64.9.62] (unknown [10.30.33.134])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4F2771955F3E;
	Sat, 23 Nov 2024 06:33:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, 228a1157)
Date: Sat, 23 Nov 2024 06:33:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <63358.124112301330500379@us-mta-198.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aN330jtbsMYAnrehHDwNpIZmsmoaf1I9OclmoHffwp8_1732343585
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag '6.13-rc-part1-SMB3-client-fixes' of git://gi=
t.samba.org/sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1557239779

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1557239779-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1557239779-x86_64-kernel-debug


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

